part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class InitialDetailState extends DetailState {}

class LoadingDetailState extends DetailState {}

class LoadedDetailState extends DetailState {
  final DetailModel detailModel;

  const LoadedDetailState({
    required this.detailModel,
  });

  @override
  List<Object> get props => [detailModel];
}

class ErrorDetailState extends DetailState {}
