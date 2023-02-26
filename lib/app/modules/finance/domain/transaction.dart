import 'package:equatable/equatable.dart';
import 'package:notes/app/modules/finance/domain/transaction_category.dart';
import 'package:notes/app/modules/finance/domain/transaction_type.dart';

class Transaction extends Equatable {
  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionCategoery category;
  final TransactionType type;

  @override
  List<Object?> get props => [id, title, amount, date, category, type];

  Transaction fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: json['amount'] as double,
      date: json['date'] as DateTime,
      category: TransactionCategoery.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      type: json['type'] as String == 'income'
          ? TransactionType.income
          : TransactionType.expense,
    );
  }
}
