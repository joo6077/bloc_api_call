import 'package:bloc/bloc.dart';
import 'package:comento_task/application/enums/order_enum.dart';
import 'package:comento_task/domain/models/ads_model.dart';
import 'package:comento_task/domain/models/list_model.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository _listRepository;

  List<int> categoryIds = [];
  int page = 1;
  int limit = 10;
  String ord = OrderEnum.asc.value;

  List<int> _generateListNthAds(List lists) {
    final totalListCount = List.generate(lists.length, (index) => index);
    final adsCount = lists.length ~/ 3;

    int j = 0;
    for (var i = adsCount; i < totalListCount.length; i += (adsCount + 1)) {
      totalListCount.insert(i, j++);
    }

    return totalListCount;
  }

  void _storeQuery(GetListEvent event) {
    if (event.categoryIds != null) {
      categoryIds = event.categoryIds!;
    }
    if (event.page != null) {
      page = event.page!;
    }
    if (event.ord != null) {
      ord = event.ord!;
    }
    if (event.limit != null) {
      limit = event.limit!;
    }
  }

  dynamic inspectValue;

  ListBloc(this._listRepository) : super(const InitListState([])) {
    on<GetListEvent>((event, emit) async {
      emit(LoadingListState());

      _storeQuery(event);

      // fetch data
      final listResult = await _listRepository.getList(
        page: page,
        limit: limit,
        ord: ord,
        category: {'id': categoryIds},
      );
      final adsResult = await _listRepository.getAds();

      // to model
      final lists = listResult.data.data;
      final ads = adsResult.data.data;
      if (lists == null) return;

      final numbers = _generateListNthAds(lists);

      emit(LoadedListState(lists: lists, numbers: numbers, ads: ads!));
    });

    on<AddListEvent>((event, emit) async {
      final listResult = await _listRepository.getList(
        page: event.page,
        category: {
          'id': [1, 2, 3]
        },
      );
    });
  }
}
