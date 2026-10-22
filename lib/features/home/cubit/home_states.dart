import '../service/models/category_model.dart';
import '../service/models/product_model.dart';

abstract class HomeStates {

}
class HomeInitial extends HomeStates {

}
class CategoriesLoading extends HomeStates {

}
class CategoriesSuccess extends HomeStates {
  final List<CategoryModel> categories;
  CategoriesSuccess(this.categories);
}
class CategoriesError extends HomeStates {
  final String errorMessege;
  CategoriesError(this.errorMessege);
}
class productsLoading extends HomeStates {

}
class productsSuccess extends HomeStates {
  final List<productModel> products;
  productsSuccess(this.products);
}
class productsError extends HomeStates {
  final String errorMessege;
  productsError(this.errorMessege);
}