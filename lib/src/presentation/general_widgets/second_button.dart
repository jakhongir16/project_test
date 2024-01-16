import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class SecondButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const SecondButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  State<SecondButton> createState() => _SecondButtonState();
}

class _SecondButtonState extends State<SecondButton> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          opacityLevel = 0.5;
        });
        widget.onPressed;
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          opacityLevel = 1.0;
        });
      },
      onTap: widget.onPressed,
      child: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: const Color(0xFF0D72FF),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStylesOfPattern.whiteButtonStyle,
          ),
        ),
      ),
    );
  }
}