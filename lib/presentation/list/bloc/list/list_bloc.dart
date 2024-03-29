import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_api_call/application/class/list_pagination.dart';
import 'package:bloc_api_call/application/class/number_history.dart';
import 'package:bloc_api_call/application/class/pagination.dart';
import 'package:bloc_api_call/application/enums/card_enum.dart';
import 'package:bloc_api_call/application/enums/order_enum.dart';
import 'package:bloc_api_call/domain/models/ads_model.dart';
import 'package:bloc_api_call/domain/models/link_model.dart';
import 'package:bloc_api_call/domain/models/list_model.dart';
import 'package:bloc_api_call/domain/repositories/comento_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository _listRepository;

  ListPagination _listPagination = ListPagination(
      categoryIds: [1, 2, 3], page: 1, limit: 5, ord: OrderEnum.asc.value);
  Pagination _adsPagination = Pagination(page: 1, limit: 3);

  NumberHistory _numberHistory = NumberHistory(
      cardEnum: CardEnum.list, lastListNumber: 0, lastAdsNumber: 0);

  void _reset() {
    _listPagination = _listPagination.copyWith(page: 1);
    _numberHistory = NumberHistory(
        cardEnum: CardEnum.list, lastListNumber: 0, lastAdsNumber: 0);
  }

  Future<FetchResult> _fetch({required int page, required int length}) async {
    final listResult = await _listRepository.getList(_listPagination);
    final linkResult = listResult.data.links;

    final numbersInfo =
        _generateListNthAds(listResult.data.data.length, length: length);

    _adsPagination =
        _adsPagination.copyWith(limit: numbersInfo.adsCountInfo, page: page);
    final adsResult = await _listRepository.getAds(_adsPagination);

    return FetchResult(
        numbers: numbersInfo.numbers,
        lists: listResult.data.data,
        ads: adsResult.data.data,
        links: linkResult,
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

  NumbersInfo _generateListNthAds(int listLimit, {required int length}) {
    final List<int> totalNumberList = [];
    final adsCount = listLimit ~/ 4;
    final totalListLength = adsCount + listLimit;

    int listCountInfo = 0;
    int adsCountInfo = 0;

    for (var i = 0; i < totalListLength; i++) {
      final initialLength = totalNumberList.length + length;

      if (initialLength == 0) {
        _updateLastList(totalNumberList);
        listCountInfo++;
        continue;
      }
      if ((initialLength + 1) % 4 == 0) {
        _updateLastAds(totalNumberList);
        adsCountInfo++;
      } else {
        _updateLastList(totalNumberList);
        listCountInfo++;
      }
    }

    return NumbersInfo(
        listCountInfo: listCountInfo,
        adsCountInfo: adsCountInfo,
        numbers: totalNumberList);
  }

  void _storeQuery(GetListEvent event) {
    _listPagination = _listPagination.copyWith(
        categoryIds: event.categoryIds,
        page: event.page,
        limit: event.limit,
        ord: event.ord);
  }

  dynamic inspectValue;
  dynamic inspectValue1;

  ListBloc(this._listRepository) : super(const InitListState([])) {
    on<GetListEvent>((event, emit) async {
      emit(LoadingListState());

      _reset();
      _storeQuery(event);

      final result = await _fetch(page: _listPagination.page, length: 0);

      emit(LoadedListState(
        lists: result.lists,
        numbers: result.numbers,
        ads: result.ads,
        links: result.links,
        hasReachedMax: result.hasReachedMax,
      ));
    });

    on<AddListEvent>((event, emit) async {
      _listPagination =
          _listPagination.copyWith(page: _listPagination.page + 1);

      final currentState = (state as LoadedListState);

      final result = await _fetch(
          page: _listPagination.page, length: currentState.numbers.length);

      emit(LoadedListState(
        numbers: currentState.numbers + result.numbers,
        lists: currentState.lists + result.lists,
        ads: currentState.ads + result.ads,
        links: result.links,
        hasReachedMax: result.hasReachedMax,
      ));
    });
  }
}

class FetchResult {
  final List<int> numbers;
  final List<ListModel> lists;
  final List<AdsModel> ads;
  final List<LinkModel> links;
  final bool hasReachedMax;

  FetchResult({
    required this.numbers,
    required this.lists,
    required this.ads,
    required this.links,
    required this.hasReachedMax,
  });
}

class NumbersInfo {
  final int listCountInfo;
  final int adsCountInfo;
  final List<int> numbers;

  NumbersInfo({
    required this.listCountInfo,
    required this.adsCountInfo,
    required this.numbers,
  });
}
