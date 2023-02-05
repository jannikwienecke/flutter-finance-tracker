import 'package:notes/app/modules/products/domain/product.dart';
import 'package:notes/app/modules/products/repos/implementations/localProductsRepo.dart';
import 'package:notes/app/modules/products/repos/productsRepo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_products_use_case.g.dart';

class SearchProducts {
  const SearchProducts({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  final ProductsRepository _productsRepository;

  Future<List<Product>> search({
    required String query,
  }) async {
    final products = await _productsRepository.fetchProductsList();

    return products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}

@riverpod
Future<List<Product>> searchProductsController(
  SearchProductsControllerRef ref, {
  required String query,
}) async {
  final productsRepo = ref.watch(productsRepositoryProvider);

  return SearchProducts(productsRepository: productsRepo).search(query: query);
}
