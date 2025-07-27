import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/features/shopping/cubit/category/category_state.dart';
import 'package:yummify/features/shopping/data/repositories/category_repository.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._repository) : super(CategoryInitial());

  final CategoryRepository _repository;

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      if (state is CategoryLoaded) return;
      final categories = await _repository.getCategories();
      print(categories[0]);
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
