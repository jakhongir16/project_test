import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class FinalPatternButtonBlue extends StatefulWidget {
  const FinalPatternButtonBlue({super.key,
    required this.titleOfButton,
    required this.onPressed,
  });

  final String titleOfButton;
  final VoidCallback onPressed;

  @override
  State<FinalPatternButtonBlue> createState() => _FinalPatternButtonBlueState();
}

class _FinalPatternButtonBlueState extends State<FinalPatternButtonBlue> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 28),
      child: GestureDetector(

        onTapDown: (TapDownDetails details){
          setState(() {
            opacityLevel = 0.5;
          });
          widget.onPressed;
        },
        onTapUp: (TapUpDetails details){
          setState(() {
            opacityLevel = 1.0;
          });
        },
        onTap: widget.onPressed,
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(
            milliseconds: 100,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top:15, bottom: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF0D72FF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.titleOfButton,
              textAlign: TextAlign.center,
              style: TextStylesOfPattern.whiteButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
