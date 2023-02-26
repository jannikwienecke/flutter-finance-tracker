import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen/widgets/summary_card.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen/widgets/transactions_card.dart';
import 'package:notes/app/shared/presentation/widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.opacity,
    required this.totalDeltaY,
    required this.duration,
  });

  final double opacity;
  final int totalDeltaY;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: ColoredBox(
        color: Colors.transparent,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: duration,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: duration,
                top: 0 + totalDeltaY.toDouble(),
                left: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Stack(
                          children: const [
                            Positioned(
                              top: 20,
                              left: 0,
                              child: GlasmorphismWrapper(
                                child: SummaryCard(),
                              ),
                            ),
                            Positioned(
                              top: 240,
                              left: 0,
                              child: TransactionsCard(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
