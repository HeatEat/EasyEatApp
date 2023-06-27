part of 'categories_bloc.dart';

enum CategoriesStatus { intial, success, failure }

abstract class CategoriesState extends Equatable {
  const CategoriesState({this.error = ''});

  final String error;
  @override
  List<Object> get props => [];
}

class LoadingCategoryState extends CategoriesState {}

class SelectedCategoryState extends CategoriesState {
  final List<CategoryModel> categories;
  const SelectedCategoryState(this.categories);
}

class ChangeCategoryState extends CategoriesState {
  final CategoryModel changeToCategory;

  const ChangeCategoryState(this.changeToCategory);
}
