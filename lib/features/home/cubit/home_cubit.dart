import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/home_service.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeService homeService;
  HomeCubit(this.homeService) : super(HomeInitial());
  void loadHomeData() async{
    emit(CategoriesLoading());
    try {
      final categories = await homeService.getCategories();
      emit(CategoriesSuccess(categories));
      final products = await homeService.getProducts(categories[0].id);
      emit(productsSuccess(products));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
  void getProductByCategoryId(int id) async{
    emit(productsLoading());
    try {
      final products = await homeService.getProducts(id);
      emit(productsSuccess(products));
    } catch (e) {
      emit(productsError(e.toString()));
    }
  }
  }
