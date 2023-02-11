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

  const LoadedListState({
    required this.numbers,
    required this.lists,
    required this.ads,
  });

  @override
  List<Object> get props => [numbers];
}

class ErrorListState extends ListState {
  final String errorMessage;

  const ErrorListState(this.errorMessage);

  @override
  List<Object> get props => [];
}
