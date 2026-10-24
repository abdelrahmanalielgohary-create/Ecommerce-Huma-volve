import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_products_by_category_id_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase;

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getProductsByCategoryIdUseCase,
  }) : super(HomeInitial());

  void loadHomeData() async {
    emit(CategoriesLoading());
    try {
      final categories = await getCategoriesUseCase();
      emit(CategoriesSuccess(categories));
      if (categories.isNotEmpty && categories[0].id != null) {
        getProductByCategoryId(categories[0].id!);
      }
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  void getProductByCategoryId(int id) async {
    emit(ProductsLoading());
    try {
      final products = await getProductsByCategoryIdUseCase(id);
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
