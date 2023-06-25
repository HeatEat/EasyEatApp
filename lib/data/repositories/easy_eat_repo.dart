import 'package:easy_eat/data/data_sources/supabase_data_source.dart';
import 'package:easy_eat/data/models/category_model.dart';

abstract class EasyEatRepository {
  Future<List> getUserOrders();
  Future<List<CategoryModel>> getCategories();
}

class EasyEatRepositoryImpl implements EasyEatRepository {
  final SupabaseDataSource supabaseDataSource;

  EasyEatRepositoryImpl(this.supabaseDataSource);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final categories = await supabaseDataSource.getCategories();

      return categories;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List> getUserOrders() {
    // TODO: implement getUserOrders
    throw UnimplementedError();
  }
}
