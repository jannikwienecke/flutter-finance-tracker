import 'package:flutter/material.dart';
import 'package:notes/app/config/constants/app_sizes.dart';
import 'package:notes/app/modules/products/domain/product.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl);
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: CustomImage(imageUrl: product.imageUrl),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 12, thickness: .5),
          ),
          gapH12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              gapH16,
              Text(
                'Euro ${product.price}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              gapH4,
              Text(
                'Quantity: ${product.availableQuantity}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
