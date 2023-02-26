import 'package:flutter/material.dart';

class TransactionsListSearchItem extends StatelessWidget {
  const TransactionsListSearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: Container(
        padding: const EdgeInsets.all(
          4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.onSecondaryContainer.withOpacity(.4),
          ),
        ),
        child: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          size: 12,
        ),
      ),
    );
  }
}
