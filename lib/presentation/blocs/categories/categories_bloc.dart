import 'package:bloc/bloc.dart';
import 'package:quotify/core/domain/usecases/categories_usecase.dart';
import 'package:quotify/presentation/blocs/categories/categories_events.dart';
import 'package:quotify/presentation/blocs/categories/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesState> {
  final CategoriesUsecase _categoriesUsecase = CategoriesUsecase();

  CategoriesBloc() : super(CategoriesInitial()) {
    on<LoadCategoriesEvent>((event, emit) async {
      try {
        final categories = await _categoriesUsecase.loadCategories();
        emit(CategoriesSuccess(categories: categories));
      } catch (e) {
        emit(CategoriesError(error: e.toString()));
      }
    });
  }
}
