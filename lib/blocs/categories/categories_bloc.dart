import 'package:bloc/bloc.dart';
import 'package:easy_eat/data/models/category_model.dart';
import 'package:easy_eat/data/repositories/easy_eat_repo.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final EasyEatRepository _repo;
  late List<CategoryModel> categories;
  CategoryModel? selectedCategory;
  CategoriesBloc(this._repo) : super(const SelectedCategoryState([])) {
    on<LoadCategoriesEvent>((event, emit) async {
      categories = await _repo.getCategories();

      categories[
              categories.indexWhere((element) => element.name == "Wszystkie")]
          .selected = true;

      var allCategory =
          categories.firstWhere((element) => element.name == "Wszystkie");
      selectedCategory = allCategory;
      selectedCategory!.selected = true;

      emit(SelectedCategoryState(categories));
    });

    on<ChangeCategoryEvent>((event, emit) {
      emit(LoadingCategoryState());
      var oldSelected =
          categories.indexWhere((element) => element.selected == true);
      var newSelected =
          categories.indexWhere((element) => element.id == event.categoryId);

      if (oldSelected != newSelected) {
        categories[oldSelected].selected = false;
        categories[newSelected].selected = true;
        selectedCategory = categories[newSelected];

        emit(SelectedCategoryState(categories));
      } else {
        emit(SelectedCategoryState(categories));
      }
    });
  }
}
