import 'package:flutter/material.dart';
import 'package:notes/app/config/constants/test_transactions.dart';
import 'package:notes/app/modules/finance/domain/transaction.dart';
import 'package:notes/app/modules/finance/domain/transaction_category.dart';
import 'package:notes/app/modules/finance/domain/transaction_type.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen/widgets/transactions_card_filter_list.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen/widgets/transactions_list_search_item.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactionList = kTestTransactions;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 380,
          width: MediaQuery.of(context).size.width - 25,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(.7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transactions'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context)
                        .colorScheme
                        .onTertiaryContainer
                        .withOpacity(.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                const TransactionCardHeader(),
                TransactionList(
                  transactions: transactionList,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          final category = transaction.category;
          // final f = DateFormat('yyyy-MM-dd');

          final isThisWeek = index < 3;
          final isThisMonth = index < 6;

          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isThisWeek && index == 0 || isThisMonth && index == 3)
                  TransactionGroupHeader(isThisWeek: isThisWeek),
                const SizedBox(height: 14),
                TransactionRow(
                  transactions: transactions,
                  category: category,
                  transaction: transaction,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TransactionGroupHeader extends StatelessWidget {
  const TransactionGroupHeader({
    super.key,
    required this.isThisWeek,
  });

  final bool isThisWeek;

  @override
  Widget build(BuildContext context) {
    return Text(
      isThisWeek ? 'This Week' : 'This Month',
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 10,
        color:
            Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.7),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TransactionRow extends StatelessWidget {
  const TransactionRow({
    super.key,
    required this.transactions,
    required this.category,
    required this.transaction,
  });

  final List<Transaction> transactions;
  final TransactionCategoery category;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: transaction.type == TransactionType.income
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.tertiaryContainer,
          ),
          child: Icon(
            category.icon,
            size: 24,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            Text(
              category.title,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context)
                    .colorScheme
                    .onTertiaryContainer
                    .withOpacity(.7),
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '${transaction.amount} €',
          style: TextStyle(
            fontSize: 15,
            color: transaction.type == TransactionType.income
                ? Colors.green
                : Theme.of(context).colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class TransactionCardHeader extends StatelessWidget {
  const TransactionCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TransactionsListSearchItem(),
        TransactionsListFilterList(),
      ],
    );
  }
}
