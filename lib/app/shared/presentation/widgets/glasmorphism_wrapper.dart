import 'dart:ui';

import 'package:flutter/material.dart';

class GlasmorphismWrapper extends StatelessWidget {
  const GlasmorphismWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

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
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
