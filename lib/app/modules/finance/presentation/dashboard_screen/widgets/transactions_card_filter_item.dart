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
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(2),
        textStyle: const TextStyle(fontSize: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: .5,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
          ),
        ),
        backgroundColor:
            Theme.of(context).colorScheme.tertiaryContainer.withOpacity(.5),
      ),
      child: Text(
        text,
        style: TextStyle(
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
    );
  }
}
