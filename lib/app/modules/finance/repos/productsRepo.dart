import 'package:notes/app/modules/products/domain/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProductsList();
}
