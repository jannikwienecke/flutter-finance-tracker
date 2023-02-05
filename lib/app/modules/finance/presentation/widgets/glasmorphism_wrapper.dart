import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/widgets/summary_card.dart';

class GlasmorphismWrapper extends StatelessWidget {
  const GlasmorphismWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40,
          ),
          child: const Center(
            child: SummaryCard(),
          ),
        ),
      ),
    );
  }
}
