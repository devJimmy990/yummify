import 'package:yummify/features/shopping/data/data_sources/meal/base_meal_data_source.dart';
import 'package:yummify/features/shopping/data/model/meal.dart';

class MealRepository {
  MealRepository(this._dataSource);
  final BaseMealDataSource _dataSource;

  Future<List<Meal>?> getMeals() async {
    try {
      final data = await _dataSource.getMeals();
      return data.map((e) => Meal.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> addMeal() async {
    try {
      return await _dataSource.addMeal();
    } catch (e) {
      rethrow;
    }
  }
}
