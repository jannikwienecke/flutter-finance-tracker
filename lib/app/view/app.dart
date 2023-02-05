import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/app/modules/finance/presentation/command_bar_screen.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_screen.dart';
import 'package:notes/app/view/color_schemes.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: HomeW(),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => {}, tooltip: 'Increment'),
    );
  }
}

class HomeW extends HookWidget {
  const HomeW({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    final started = useState(false);
    final totalDeltaY = useState(0);
    final opacity = useState<double>(1);

    double interpolateTotalDeltaYToOpacity(int totalDeltaY) {
      final opacity = 1 - (totalDeltaY / 150);
      if (opacity < 0) {
        return 0;
      } else if (opacity > 1) {
        return 1;
      } else {
        return opacity;
      }
    }

    useEffect(
      () {
        if (totalDeltaY.value > 130) {
          focusNode.requestFocus();
        } else if (totalDeltaY.value < 130) {
          focusNode.unfocus();
        }
        return null;
      },
      // when the stream changes, useEffect will call the callback again.
      [totalDeltaY.value],
    );

    void handlePanEnd(DragEndDetails _) {
      if (totalDeltaY.value < 150) {
        started.value = false;
        totalDeltaY.value = 0;
        opacity.value = 1;
      }
    }

    void handlePanUpdate(DragUpdateDetails details) {
      final totalDelya = details.delta.dy.toInt() + totalDeltaY.value;

      if (totalDelya < 0) {
        totalDeltaY.value = 0;
      } else if (totalDelya > 150) {
        totalDeltaY.value = 150;
      } else {
        totalDeltaY.value = totalDelya;
      }

      opacity.value = interpolateTotalDeltaYToOpacity(totalDeltaY.value);
    }

    void handlePanDown(DragDownDetails _) {
      started.value = !started.value;
    }

    const duration = Duration(milliseconds: 300);

    return Stack(
      children: [
        GestureDetector(
          onPanDown: handlePanDown,
          onPanUpdate: handlePanUpdate,
          onPanEnd: handlePanEnd,
          child: DashBoardScreen(
            totalDeltaY: totalDeltaY,
            opacity: opacity,
            duration: duration,
          ),
        ),
        GestureDetector(
          onPanDown: handlePanDown,
          onPanUpdate: handlePanUpdate,
          onPanEnd: handlePanEnd,
          child: CommandBarScreen(
            totalDeltaY: totalDeltaY,
            opacity: opacity,
            focusNode: focusNode,
            duration: duration,
          ),
        ),
      ],
    );
  }
}
