import 'package:equatable/equatable.dart';
import 'package:yummify/features/shopping/data/model/meal.dart';

sealed class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  const MealLoaded(this.meals);
  final List<Meal> meals;
  List<Meal> get popularMeals {
    if (meals.isNotEmpty) {
      return meals..sort((a, b) => b.reviews.compareTo(a.reviews));
    }
    return [];
  }

  List<Meal> getMealsByCategory(String category) {
    if (meals.isNotEmpty) {
      return meals.where((meal) => meal.category == category).toList();
    }
    return [];
  }

  @override
  List<Object> get props => [meals];
}

class MealError extends MealState {
  const MealError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
