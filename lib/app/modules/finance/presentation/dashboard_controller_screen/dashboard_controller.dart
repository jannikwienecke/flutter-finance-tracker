import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes/app/modules/finance/presentation/command_bar_screen/command_bar_screen.dart';
import 'package:notes/app/modules/finance/presentation/constants.dart';
import 'package:notes/app/modules/finance/presentation/controller/dashboard_controller_handler.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:notes/app/shared/presentation/widgets/widgets.dart';

class DashboardController extends HookConsumerWidget {
  const DashboardController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    final dashboardState = ref.watch(dashboardControllerHandlerProvider);
    final globalAppStateNotifier =
        ref.read(dashboardControllerHandlerProvider.notifier);

    final showCommandbar = dashboardState.showCommandbar;

    final handlePanDown = globalAppStateNotifier.handlePanDown;
    final handlePanUpdate = globalAppStateNotifier.handlePanUpdate;
    final handlePanEnd = globalAppStateNotifier.handlePanEnd;

    final opacity = dashboardState.opacity;
    final totalDeltaY = dashboardState.totalDeltaY;

    useEffect(
      () {
        if (dashboardState.totalDeltaY > 130) {
          focusNode.requestFocus();
        } else if (dashboardState.totalDeltaY < 130) {
          focusNode.unfocus();
        }
        return null;
      },
      // when the stream changes, useEffect will call the callback again.
      [dashboardState.totalDeltaY],
    );

    final duration = CBConfig.animationDuration;

    return Stack(
      children: [
        ColorCircle(
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
          top: 110,
          left: -50,
          size: 180,
        ),
        ColorCircle(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          top: 0,
          left: 200,
          size: 200,
        ),

        // CommandBarScreen(
        //   totalDeltaY: totalDeltaY,
        //   opacity: opacity,
        //   focusNode: focusNode,
        //   duration: duration,
        // )

        GestureDetector(
          onPanDown: handlePanDown,
          onPanUpdate: handlePanUpdate,
          onPanEnd: handlePanEnd,
          child: DashboardScreen(
            totalDeltaY: totalDeltaY,
            opacity: opacity,
            duration: duration,
          ),
        ),
        GestureDetector(
          onPanDown: handlePanDown,
          onPanUpdate: handlePanUpdate,
          onPanEnd: handlePanEnd,
          child: showCommandbar
              ? CommandBarScreen(
                  totalDeltaY: totalDeltaY,
                  opacity: opacity,
                  focusNode: focusNode,
                  duration: duration,
                )
              : const Text(''),
        ),
      ],
    );
  }
}
