import 'package:equatable/equatable.dart';
import 'package:yummify/features/shopping/data/model/category.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  const CategoryLoaded(this.categories);
  final List<Category> categories;

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  const CategoryError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
