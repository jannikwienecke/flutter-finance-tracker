import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    super.key,
    required this.top,
    required this.left,
    required this.size,
    required this.color,
  });

  final double top;
  final double left;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: -50,
      // left: 250,
      top: top,
      left: left,
      child: Container(
        // height: 250,
        // width: 250,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(500),
        ),
      ),
    );
  }
}
