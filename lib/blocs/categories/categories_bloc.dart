import 'package:bloc/bloc.dart';
import 'package:easy_eat/data/models/category_model.dart';
import 'package:easy_eat/data/repositories/easy_eat_repo.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final EasyEatRepository _repo;
  List<CategoryModel>? categories;
  CategoriesBloc(this._repo) : super(CategoriesInitial()) {
    on<LoadCategoriesEvent>((event, emit) {
      final categories = _repo.getCategories();
    });
  }
}
