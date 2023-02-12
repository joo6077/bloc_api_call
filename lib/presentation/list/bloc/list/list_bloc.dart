import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:comento_task/application/class/list_pagination.dart';
import 'package:comento_task/application/class/number_history.dart';
import 'package:comento_task/application/class/pagination.dart';
import 'package:comento_task/application/enums/card_enum.dart';
import 'package:comento_task/application/enums/order_enum.dart';
import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository _listRepository;

  ListPagination _listPagination = ListPagination(
      categoryIds: [1, 2, 3], page: 1, limit: 10, ord: OrderEnum.asc.value);
  Pagination _adsPagination = Pagination(page: 1, limit: 3);

  NumberHistory _numberHistory = NumberHistory(
      cardEnum: CardEnum.list, lastListNumber: 0, lastAdsNumber: 0);

  void _reset() {
    _listPagination = _listPagination.copyWith(page: 1, limit: 10);
    _numberHistory = NumberHistory(
        cardEnum: CardEnum.list, lastListNumber: 0, lastAdsNumber: 0);
  }

  Future<FetchResult> _fetch({required int page, required int length}) async {
    final listResult = await _listRepository.getList(_listPagination);
    _adsPagination = _adsPagination.copyWith(
        limit:
            (listResult.data.data.length + listResult.data.data.length ~/ 4) ~/
                4,
        page: page);
    final adsResult = await _listRepository.getAds(_adsPagination);

    final numbers =
        _generateListNthAds(listResult.data.data.length, length: length);

    return FetchResult(
        numbers: numbers,
        lists: listResult.data.data,
        ads: adsResult.data.data,
        hasReachedMax: listResult.data.to == listResult.data.total);
  }

  void _updateLastAds(List list) {
    list.add(_numberHistory.lastAdsNumber);
    _numberHistory = _numberHistory.copyWith(
        lastAdsNumber: _numberHistory.lastAdsNumber + 1,
        cardEnum: CardEnum.ads);
  }

  void _updateLastList(List list) {
    list.add(_numberHistory.lastListNumber);
    _numberHistory = _numberHistory.copyWith(
        lastListNumber: _numberHistory.lastListNumber + 1,
        cardEnum: CardEnum.list);
  }

  List<int> _generateListNthAds(int listLimit, {required int length}) {
    final List<int> totalNumberList = [];
    final adsCount = listLimit ~/ 4;
    final totalListLength = adsCount + listLimit;

    for (var i = 0; i < totalListLength; i++) {
      final initialLength = totalNumberList.length + length;
      if (initialLength == 0) {
        _updateLastList(totalNumberList);
        continue;
      }
      if ((initialLength + 1) % 4 == 0) {
        _updateLastAds(totalNumberList);
      } else {
        _updateLastList(totalNumberList);
      }
    }

    return totalNumberList;
  }

  void _storeQuery(GetListEvent event) {
    _listPagination = _listPagination.copyWith(
        categoryIds: event.categoryIds,
        page: event.page,
        limit: event.limit,
        ord: event.ord);
  }

  dynamic inspectValue;

  ListBloc(this._listRepository) : super(const InitListState([])) {
    on<GetListEvent>((event, emit) async {
      emit(LoadingListState());

      _reset();
      _storeQuery(event);

      final result = await _fetch(page: _listPagination.page, length: 0);

      emit(LoadedListState(
          lists: result.lists, numbers: result.numbers, ads: result.ads));
    });

    on<AddListEvent>((event, emit) async {
      _listPagination = _listPagination.copyWith(page: event.page);

      final currentState = (state as LoadedListState);

      final result =
          await _fetch(page: event.page, length: currentState.numbers.length);

      emit(LoadedListState(
        numbers: currentState.numbers + result.numbers,
        lists: currentState.lists + result.lists,
        ads: currentState.ads + result.ads,
        hasReachedMax: result.hasReachedMax,
      ));
    });
  }
}

class FetchResult {
  final List<int> numbers;
  final List<ListModel> lists;
  final List<AdsModel> ads;
  final bool hasReachedMax;

  FetchResult({
    required this.numbers,
    required this.lists,
    required this.ads,
    required this.hasReachedMax,
  });
}
