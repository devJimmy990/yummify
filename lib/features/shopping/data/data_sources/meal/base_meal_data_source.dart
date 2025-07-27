abstract class BaseMealDataSource {
  Future<List<Map<String, dynamic>>> getMeals();
  Future<String> addMeal();
}
