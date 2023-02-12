import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:comento_task/domain/models/category_item_model.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ListRepository _listRepository;

  CategoryBloc(this._listRepository) : super(InitialCategoryState()) {
    on<GetCategoryEvent>((event, emit) async {
      final categoryResult = await _listRepository.getFilterCategory();
      emit(LoadedCategoryState(categories: categoryResult.data.data!));
    });
  }
}
