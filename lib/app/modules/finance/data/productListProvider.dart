import 'package:notes/app/modules/products/domain/product.dart';
import 'package:notes/app/modules/products/repos/implementations/localProductsRepo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'productListProvider.g.dart';

@riverpod
Future<List<Product>> fetchProductsList(FetchProductsListRef ref) async {
  final productsRepo = ref.watch(productsRepositoryProvider);
  return productsRepo.fetchProductsList();
}

@riverpod
Future<List<Product>> searchProductsList(
  SearchProductsListRef ref, {
  required String query,
}) async {
  final productsRepo = ref.watch(productsRepositoryProvider);

  final products = await productsRepo.fetchProductsList();

  return products.where((product) {
    return product.title.toLowerCase().contains(query.toLowerCase());
  }).toList();
}
