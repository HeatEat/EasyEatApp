part of 'categories_bloc.dart';

enum CategoriesStatus { intial, success, failure }

abstract class CategoriesState extends Equatable {
  const CategoriesState({
    this.status = CategoriesStatus.intial,
    this.categories = const <CategoryModel>[],
    this.hasReachedMax = false,
    this.isSelected = false,
    this.error = '',
  });

  final CategoriesStatus status;
  final List<CategoryModel> categories;
  final bool hasReachedMax;
  final bool isSelected;
  final String error;
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesSelect extends CategoriesState {
  @override
  final List<CategoryModel> categories;

  const CategoriesSelect(this.categories) : super(categories: categories);
}
