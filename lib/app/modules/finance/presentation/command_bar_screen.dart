import 'package:flutter/material.dart';

class CommandBarScreen extends StatelessWidget {
  const CommandBarScreen({
    super.key,
    required this.opacity,
    required this.totalDeltaY,
    required this.focusNode,
    required this.duration,
  });

  final ValueNotifier<double> opacity;
  final ValueNotifier<int> totalDeltaY;
  final FocusNode focusNode;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1 - opacity.value,
      duration: duration,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: duration,
            top: -150 + totalDeltaY.value.toDouble(),
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AnimatedOpacity(
                      opacity: opacity.value.toDouble() < 0.1 ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: TextField(
                        focusNode: focusNode,
                        autofocus: totalDeltaY.value.toDouble() > 100,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
