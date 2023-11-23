import 'package:quotify/core/data/models/categories.dart';
import 'package:quotify/core/domain/repositories/base_repository.dart';

abstract class CategoriesRepository extends BaseRepository {
  Future<List<Category>> loadCategories();
}
