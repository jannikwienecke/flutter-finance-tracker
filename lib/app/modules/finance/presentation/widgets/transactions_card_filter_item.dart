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
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.tertiaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.onSecondaryContainer,
          ),
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
        ),
      ),
    );
  }
}
