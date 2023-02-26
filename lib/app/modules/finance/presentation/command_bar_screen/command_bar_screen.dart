import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes/app/modules/finance/presentation/constants.dart';
import 'package:notes/app/modules/finance/presentation/controller/dashboard_controller_handler.dart';

class CommandBarScreen extends HookConsumerWidget {
  const CommandBarScreen({
    super.key,
    required this.opacity,
    required this.totalDeltaY,
    required this.focusNode,
    required this.duration,
  });

  final double opacity;
  final int totalDeltaY;
  final FocusNode focusNode;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardController =
        ref.read(dashboardControllerHandlerProvider.notifier);

    final showTextFieldPlaceholder = useState(false);

    void handleClickSearchField() {
      focusNode.requestFocus();
      showTextFieldPlaceholder.value = false;
    }

    void handleSubmitted(String value) {
      if (value.isEmpty) {
        showTextFieldPlaceholder.value = true;
        focusNode.unfocus();
      } else {
        showTextFieldPlaceholder.value = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: const Text('Please enter a command'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    return AnimatedOpacity(
      opacity: 1 - opacity,
      // opacity: 1,
      duration: duration,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: duration,
            top: -CBConfig.height + totalDeltaY.toDouble(),
            // top: 0,
            left: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.3),
                    child: NotificationListener(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          final scrollDown = notification.scrollDelta! > 0;

                          if (scrollDown) {
                            focusNode.unfocus();
                            showTextFieldPlaceholder.value = true;
                          }
                        }
                        return false;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 30,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Applications'),
                                  ),
                                  ApplicationList(),
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Suggestions'),
                                  ),
                                  CommandList()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // CommandTextField
                  if (showTextFieldPlaceholder.value == false)
                    Positioned(
                      // bottom: 100,/
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 50,
                            sigmaY: 50,
                          ),
                          child: CommandTextField(
                            focusNode: focusNode,
                            autoFocus: totalDeltaY.toDouble() > 100,
                            onSubmitted: handleSubmitted,
                          ),
                        ),
                      ),
                    ),

                  if (showTextFieldPlaceholder.value == true)
                    Positioned(
                      // bottom: 100,/
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 100,
                            sigmaY: 100,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 12,
                              bottom: MediaQuery.of(context).padding.bottom,
                            ),

                            //
                            child: CommandTextFieldNotActive(
                              onTap: handleClickSearchField,
                            ),
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

class CommandTextFieldNotActive extends StatelessWidget {
  const CommandTextFieldNotActive({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      // focusNode: focusNode2,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Enter a search term',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.all(4),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
        hintStyle: TextStyle(
          // center hint text
          color: Colors.white.withOpacity(.5),
        ),
      ),
    );
  }
}

class CommandTextField extends HookWidget {
  const CommandTextField({
    super.key,
    required this.focusNode,
    required this.autoFocus,
    required this.onSubmitted,
  });

  final FocusNode focusNode;
  final bool autoFocus;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = controller.text;

    return Container(
      // background - same as keyboard
      decoration: const BoxDecoration(
        // color: Theme.of(context).colorScheme.brightness,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E).withOpacity(0.5),
        ),
        child: TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
          autofocus: autoFocus,
          decoration: InputDecoration(
            hintText: 'Enter a search term',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 16,
              ),
            ),
            contentPadding: const EdgeInsets.all(4),
            filled: true,
            prefixIcon: const Icon(Icons.search),
            fillColor: const Color(0x00555555).withOpacity(.5),
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
            ),

            // #FFFFFF
          ),
        ),
      ),
    );
  }
}

class CommandList extends StatelessWidget {
  const CommandList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommandRow(
          onTap: () {},
          title: 'Income',
          subtitle: 'Add income',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Expense',
          subtitle: 'Add Expense',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Show Expense "Food"',
          subtitle: '',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Show Expense "Food"',
          subtitle: '',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Show Expense "Food"',
          subtitle: '',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Income',
          subtitle: 'Add income',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Expense',
          subtitle: 'Add Expense',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Show Expense "Food"',
          subtitle: '',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Show Expense "Food"',
          subtitle: '',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Show Expense "Food"',
          subtitle: '',
        ),
        const SizedBox(height: 4),
        CommandRow(
          onTap: () {},
          title: 'Income',
          subtitle: 'Add income',
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class CommandRow extends StatelessWidget {
  const CommandRow({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    // height: double.infinity,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    child: Icon(
                      Icons.attach_money_outlined,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Column(
                      //   children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      if (subtitle.isNotEmpty)
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationList extends StatelessWidget {
  const ApplicationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onBackground.withOpacity(.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ApplicationItem(
            onTap: () {},
            icon: Icons.wallet,
            title: 'Wallet',
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          ApplicationItem(
            onTap: () {},
            title: 'Transactions',
            icon: Icons.attach_money_outlined,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          ApplicationItem(
            onTap: () {},
            icon: Icons.auto_graph,
            title: 'Summary',
            color: Theme.of(context).colorScheme.background,
          ),
          ApplicationItem(
            onTap: () {},
            title: 'Editor',
            icon: Icons.edit,
            color: Theme.of(context).colorScheme.onBackground,
            textColor: Theme.of(context).colorScheme.background,
          ),
        ],
      ),
    );
  }
}

class ApplicationItem extends StatelessWidget {
  const ApplicationItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.color,
    this.textColor,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.width * 0.16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color:
                      textColor ?? Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
