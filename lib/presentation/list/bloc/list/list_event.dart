part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends ListEvent {
  final List<int>? categoryIds;
  final int? page;
  final int? limit;
  final String? ord;

  const GetListEvent({this.categoryIds, this.page, this.limit, this.ord});
}

class AddListEvent extends ListEvent {
  final int page;

  const AddListEvent(this.page);

  @override
  List<Object> get props => [page];
}
