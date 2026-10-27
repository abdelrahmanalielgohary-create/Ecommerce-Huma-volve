import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';

import '../../../core/constants/api_endpoints.dart';
import 'models/category_model.dart';
import 'models/product_model.dart';

class HomeService {
  final ApiClient apiClient;
  HomeService(this.apiClient);

  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClient.dio.get(ApiEndpoints.categoriesEndpoint);
    final List jsonData = response.data;
    final List<CategoryModel> categories =
        jsonData.map((e) => CategoryModel.fromJson(e)).toList();
    return categories;
  }

  Future<List<productModel>> getProducts(int? categoryId) async {
    final response = await apiClient.dio.get(
        "${ApiEndpoints.categoriesEndpoint}/$categoryId/${ApiEndpoints.productsEndpoint}");
    final List jsonData = response.data;
    final List<productModel> products =
        jsonData.map((e) => productModel.fromJson(e)).toList();
    return products;
  }

  Future<productModel> getProductById(int id) async {
    final response = await apiClient.dio.get("${ApiEndpoints.productsEndpoint}/$id");
    return productModel.fromJson(response.data);
  }
}
