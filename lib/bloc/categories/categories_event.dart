part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends CategoriesEvent {}

class ChangeCategoryEvent extends CategoriesEvent {
  final int categoryId;

  const ChangeCategoryEvent(this.categoryId);
}
