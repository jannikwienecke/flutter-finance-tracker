// scaffold

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes/app/modules/products/presentation/widgets/product_grid.dart';
import 'package:notes/app/modules/products/presentation/widgets/product_search_field.dart';
import 'package:notes/app/modules/products/use-cases/search_products_use_case.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(searchProductsControllerProvider(query: 'c'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop1'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ColoredBox(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ProductSearch(),
              const SizedBox(height: 16),
              Expanded(
                flex: 12,
                child: products.when(
                  data: (data) => ProductGrid(products: data),
                  loading: () => const Text('loading'),
                  error: (error, stack) => const Text('error'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
