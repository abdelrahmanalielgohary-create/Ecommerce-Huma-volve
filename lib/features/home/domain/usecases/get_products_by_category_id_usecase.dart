import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';

class GetProductsByCategoryIdUseCase {
  final HomeRepository repository;

  GetProductsByCategoryIdUseCase(this.repository);

  Future<List<ProductEntity>> call(int? categoryId) {
    return repository.getProducts(categoryId);
  }
}
