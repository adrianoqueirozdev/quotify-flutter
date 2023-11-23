import 'package:quotify/core/data/models/categories.dart';

abstract class CategoriesState {
  List<Category>? categories;
  String? error;

  CategoriesState({this.categories, this.error});
}

class CategoriesInitial extends CategoriesState {
  CategoriesInitial() : super(categories: []);
}

class CategoriesSuccess extends CategoriesState {
  CategoriesSuccess({required List<Category> categories}) : super(categories: categories);
}

class CategoriesError extends CategoriesState {
  CategoriesError({required String error}) : super(categories: [], error: error);
}
