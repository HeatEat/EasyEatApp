import 'package:easy_eat/data/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseDataSource {
  Future getCategories();
}

class SupabaseDataSourceImp implements SupabaseDataSource {
  final GoTrueClient _auth = Supabase.instance.client.auth;
  final supabase = Supabase.instance.client;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final List data = await supabase.from('category').select();
    final categories =
        data.map((json) => CategoryModel.fromJson(json)).toList();
    return categories;
  }
}
