// add class Product extend Equatable
// with title, Price Quantity
// copyWith Method

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });
  final String title;
  final double price;
  final String id;
  final String imageUrl;
  final String description;
  final int availableQuantity;

  @override
  List<Object> get props =>
      [title, price, id, imageUrl, description, availableQuantity];

  Product copyWith({
    required String? title,
    required double? price,
    required String? id,
    required String? imageUrl,
    required String? description,
    required int? availableQuantity,
  }) {
    return Product(
      title: title ?? this.title,
      price: price ?? this.price,
      id: this.id,
      imageUrl: this.imageUrl,
      description: this.description,
      availableQuantity: this.availableQuantity,
    );
  }
}
