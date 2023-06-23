import 'package:easy_eat/data/data_sources/supabase_data_source.dart';

abstract class EasyEatRepository {
  Future<List> getUserOrders();
  Future getCategories();
}

class EasyEatRepositoryImpl implements EasyEatRepository {
  final SupabaseDataSource supabaseDataSource;

  EasyEatRepositoryImpl(this.supabaseDataSource);

  @override
  Future getCategories() async {
    try {
      final categoires = await supabaseDataSource.getCategories();

      return categoires;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List> getUserOrders() {
    // TODO: implement getUserOrders
    throw UnimplementedError();
  }
}
