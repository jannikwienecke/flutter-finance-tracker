import 'package:flutter/material.dart';

class TransactionCardFilterItem extends StatelessWidget {
  const TransactionCardFilterItem({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: !isSelected
              ? Theme.of(
                  context,
                ).colorScheme.onSecondary.withOpacity(.4)
              : Theme.of(
                  context,
                ).colorScheme.primary,
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(1),
          backgroundColor:
              Theme.of(context).colorScheme.tertiaryContainer.withOpacity(.5),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: isSelected
                ? Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer
                : Theme.of(
                    context,
                  ).colorScheme.onSecondaryContainer,
          ),
          // ),
        ),
      ),
    );
  }
}
