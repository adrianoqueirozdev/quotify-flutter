import 'package:quotify/core/data/models/categories.dart';
import 'package:quotify/core/data/repositories/categories_repository_impl.dart';

class CategoriesUsecase {
  late final CategoriesRepositoryImpl _categoriesRepository;

  CategoriesUsecase() {
    _categoriesRepository = CategoriesRepositoryImpl();
  }

  Future<List<Category>> loadCategories() async {
    return await _categoriesRepository.loadCategories();
  }
}
