import 'package:flutter/material.dart';

class PatternButtonTitle extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const PatternButtonTitle({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}