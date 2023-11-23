import 'package:quotify/core/data/models/categories.dart';
import 'package:quotify/core/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  @override
  Future<List<Category>> loadCategories() async {
    final response = await quotifyApi.get('categories');

    final categories = CategoriesResponse.fromJson(response);

    return categories.data!;
  }
}
