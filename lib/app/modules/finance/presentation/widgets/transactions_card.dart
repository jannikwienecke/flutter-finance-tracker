import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/widgets/transactions_card_filter_list.dart';
import 'package:notes/app/modules/finance/presentation/widgets/transactions_list_search_item.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 300,
          width: 360,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    TransactionsListSearchItem(),
                    TransactionsListFilterList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
