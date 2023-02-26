import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TransactionCategoery extends Equatable {
  factory TransactionCategoery.fromJson(Map<String, dynamic> json) {
    return TransactionCategoery(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as IconData,
    );
  }
  const TransactionCategoery({
    required this.id,
    required this.title,
    required this.icon,
  });

  final String id;
  final String title;
  final IconData icon;

  @override
  List<Object> get props => [id, title, icon];
}
