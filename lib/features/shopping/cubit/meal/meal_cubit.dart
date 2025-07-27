import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_state.dart';
import 'package:yummify/features/shopping/data/repositories/meal_repository.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit(this._repository) : super(MealInitial());

  final MealRepository _repository;

  Future<void> getMeals() async {
    emit(MealLoading());
    try {
      if (state is MealLoaded) return;
      final meals = await _repository.getMeals();
      emit(MealLoaded(meals ?? []));
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  Future<void> addMeal() async {
    emit(MealLoading());
    try {
      print("debug-adding meal");
      final result = await _repository.addMeal();
      print("debug-adding meal: $result");
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }
}
