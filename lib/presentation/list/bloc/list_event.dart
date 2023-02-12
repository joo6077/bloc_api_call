part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends ListEvent {}

class AddListEvent extends ListEvent {
  final int page;

  const AddListEvent(this.page);
}
