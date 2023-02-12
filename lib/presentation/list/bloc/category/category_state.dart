part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class InitialCategoryState extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  final List<CategoryItemModel> categories;

  const LoadedCategoryState({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}

class ErrorCategoryState extends CategoryState {}
