import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository listRepository;

  List<int> _generateListNthAds(List lists) {
    final totalListCount = List.generate(lists.length, (index) => index);
    final adsCount = lists.length ~/ 3;

    int j = 0;
    for (var i = adsCount; i < totalListCount.length; i += (adsCount + 1)) {
      totalListCount.insert(i, j++);
    }

    return totalListCount;
  }

  dynamic inspectValue;

  ListBloc(this.listRepository) : super(const InitListState([])) {
    on<GetListEvent>((event, emit) async {
      emit(LoadingListState());

      // fetch data
      final listResult = await listRepository.getList(
        category: {
          'id': [1, 2, 3]
        },
      );
      final adsResult = await listRepository.getAds();

      // to model
      final lists = listResult.data.data;
      final ads = adsResult.data.data;
      if (lists == null) return;

      final numbers = _generateListNthAds(lists);

      emit(LoadedListState(lists: lists, numbers: numbers, ads: ads!));
    });

    on<AddListEvent>((event, emit) async {
      final listResult = await listRepository.getList(
        page: event.page,
        category: {
          'id': [1, 2, 3]
        },
      );
      print((state as LoadedListState).numbers);
    });
  }
}
