import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes/app/modules/finance/presentation/controller/dashboard_controller_handler.dart';
import 'package:notes/app/modules/finance/presentation/dashboard_controller_screen/dashboard_controller.dart';
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
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
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
    final dashboardControllerNotifier =
        ref.read(dashboardControllerHandlerProvider.notifier);
    final dashboardState = ref.watch(dashboardControllerHandlerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const DashboardController(),

      // multiple floating action buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: dashboardControllerNotifier.toggleShowCommandbar,
            child: Icon(
              dashboardState.showCommandbar ? Icons.close : Icons.search,
            ),
          ),
          const SizedBox(height: 10),
          if (!dashboardState.showCommandbar)
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Add Expense'),
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            ),
        ],
      ),
    );
  }
}
