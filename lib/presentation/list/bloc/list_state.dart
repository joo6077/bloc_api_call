part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class InitListState extends ListState {
  final List<ListModel> lists;

  const InitListState(this.lists);

  @override
  List<Object> get props => [];
}

class LoadingListState extends ListState {
  @override
  List<Object> get props => [];
}

class LoadedListState extends ListState {
  final List<int> numbers;
  final List<ListModel> lists;
  final List<AdsModel> ads;
  final bool hasReachedMax;

  const LoadedListState({
    required this.numbers,
    required this.lists,
    required this.ads,
    this.hasReachedMax = false,
  });

  LoadedListState copyWith({
    List<int>? numbers,
    List<ListModel>? lists,
    List<AdsModel>? ads,
  }) {
    return LoadedListState(
      numbers: numbers ?? this.numbers,
      lists: lists ?? this.lists,
      ads: ads ?? this.ads,
    );
  }

  @override
  List<Object> get props => [numbers];

  // void add({
  //   List<int> numberItems = const [],
  //   List<ListModel> listItems = const [],
  //   List<AdsModel> adsItems = const [],
  // }) {
  //   _numbers.addAll(numberItems);
  //   _lists.addAll(listItems);
  //   adsItems.addAll(adsItems);
  // }

  // void reset() {
  //   _numbers.removeRange(0, _numbers.length);
  //   _lists.removeRange(0, _lists.length);
  //   _ads.removeRange(0, _ads.length);
  // }
}

class ErrorListState extends ListState {
  final String errorMessage;

  const ErrorListState(this.errorMessage);

  @override
  List<Object> get props => [];
}
