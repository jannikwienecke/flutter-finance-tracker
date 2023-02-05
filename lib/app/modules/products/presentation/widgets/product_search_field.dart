import 'package:flutter/material.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        style: Theme.of(context).textTheme.titleLarge,
        decoration: const InputDecoration(
          hintText: 'Search products',
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
