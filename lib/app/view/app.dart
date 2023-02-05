import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes/app/modules/finance/presentation/widgets/dashboard_controller.dart';
import 'package:notes/app/view/color_schemes.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  ThemeState();

  @override
  ThemeMode build() {
    return ThemeMode.dark;
  }

  void toggleThemeMode() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
  }
}

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);

    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: themeState,
        home: const Home(),
      ),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: DashboardController(),
      ),
      // multiple floating action buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // toggle dark mode
          FloatingActionButton(
            onPressed: () => {
              ref.read(themeStateProvider.notifier).toggleThemeMode(),
            },
            tooltip: 'Toggle Dark Mode',
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            child: Icon(
              Icons.brightness_4,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Transaction'),
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
