import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen/widgets/transactions_card_filter_item.dart';

const List<String> _filterItems = [
  'All',
  'Income',
  'Expense',
  'Food',
  'Transport',
  'Shopping',
  'Entertainment',
];

class TransactionsListFilterList extends StatelessWidget {
  const TransactionsListFilterList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filterItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: TransactionCardFilterItem(
                text: _filterItems[index],
                onTap: () {
                  print('Filter item tapped');
                },
                isSelected: index == 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
