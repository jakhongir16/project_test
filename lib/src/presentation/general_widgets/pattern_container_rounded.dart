import 'package:flutter/material.dart';

class PatternContainerRounded extends StatelessWidget {
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const PatternContainerRounded({
    super.key,
    this.borderRadius,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}