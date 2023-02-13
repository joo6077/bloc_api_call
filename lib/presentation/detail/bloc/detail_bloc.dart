import 'package:bloc/bloc.dart';
import 'package:comento_task/domain/models/detail_model.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ListRepository _listRepository;

  Response? test;
  dynamic inspectValue;

  DetailBloc(this._listRepository) : super(InitialDetailState()) {
    on<GetDetailEvent>((event, emit) async {
      emit(LoadingDetailState());

      final detailResult = await _listRepository.getDetail(event.id);

      emit(LoadedDetailState(detailModel: detailResult.data.data));
    });
  }
}
