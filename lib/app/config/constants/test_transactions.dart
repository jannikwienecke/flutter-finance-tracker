import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/domain/transaction.dart';
import 'package:notes/app/modules/finance/domain/transaction_category.dart';
import 'package:notes/app/modules/finance/domain/transaction_type.dart';

List<Transaction> kTestTransactions = [
  Transaction(
    id: '1',
    title: 'Sirum Gmbh',
    amount: 2800,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.work,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '2',
    title: 'Work Hamann',
    amount: 420,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '53',
    title: 'Rewe',
    amount: 3.43,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '12',
      title: 'Food',
      icon: Icons.local_grocery_store_outlined,
    ),
    type: TransactionType.expense,
  ),
  Transaction(
    id: '22',
    title: 'Edeka',
    amount: 8.43,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '12',
      title: 'Food',
      icon: Icons.local_grocery_store_outlined,
    ),
    type: TransactionType.expense,
  ),
  Transaction(
    id: '3',
    title: 'Salary',
    amount: 1000,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '4',
    title: 'Salary',
    amount: 1000,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '5',
    title: 'Salary',
    amount: 1000,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '6',
    title: 'Salary',
    amount: 1000,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '7',
    title: 'Salary',
    amount: 1000,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  ),
  Transaction(
    id: '8',
    title: 'Salary',
    amount: 1000,
    date: DateTime.now(),
    category: const TransactionCategoery(
      id: '1',
      title: 'Salary',
      icon: Icons.money,
    ),
    type: TransactionType.income,
  )
];
