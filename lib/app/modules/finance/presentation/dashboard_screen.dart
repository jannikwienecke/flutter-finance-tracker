import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/widgets/color_circle.dart';
import 'package:notes/app/modules/finance/presentation/widgets/glasmorphism_wrapper.dart';
import 'package:notes/app/modules/finance/presentation/widgets/transactions_card.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({
    super.key,
    required this.opacity,
    required this.totalDeltaY,
    required this.duration,
  });

  final ValueNotifier<double> opacity;
  final ValueNotifier<int> totalDeltaY;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: AnimatedOpacity(
        opacity: opacity.value,
        duration: duration,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: duration,
              top: 0 + totalDeltaY.value.toDouble(),
              left: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ColorCircle(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.9),
                            top: 60,
                            left: -50,
                            size: 180,
                          ),
                          ColorCircle(
                            color:
                                Theme.of(context).colorScheme.tertiaryContainer,
                            top: -50,
                            left: 200,
                            size: 200,
                          ),
                          const Positioned(
                            top: 20,
                            left: 0,
                            child: GlasmorphismWrapper(),
                          ),
                          const Positioned(
                            top: 250,
                            child: Material(
                              elevation: 36,
                              child: TransactionsCard(),
                            ),
                          )
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
    );
  }
}
