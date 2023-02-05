import 'package:notes/app/config/constants/test_products.dart';
import 'package:notes/app/modules/products/domain/product.dart';
import 'package:notes/app/modules/products/repos/productsRepo.dart';
import 'package:notes/app/shared/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localProductsRepo.g.dart';

class FakeProductRepository implements ProductsRepository {
  final _products = InMemoryStore<List<Product>>(List.from(kTestProducts));

  @override
  Future<List<Product>> fetchProductsList() async {
    return Future.value(_products.value);
  }
}

@riverpod
FakeProductRepository productsRepository(ProductsRepositoryRef ref) {
  return FakeProductRepository();
}
