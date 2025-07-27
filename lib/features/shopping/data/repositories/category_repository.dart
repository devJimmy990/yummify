import 'package:yummify/features/shopping/data/data_sources/category/base_category_data_source.dart';
import 'package:yummify/features/shopping/data/model/category.dart';

class CategoryRepository {
  CategoryRepository(this._dataSource);
  final BaseCategoryDataSource _dataSource;

  Future<List<Category>> getCategories() async {
    try {
      final data = await _dataSource.getCategories();
      return data.map((e) => Category.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
