import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PatternButtonSvg extends StatefulWidget {
  final VoidCallback onTap;
  final String svgPath;

  const PatternButtonSvg({
    super.key,
    required this.onTap,
    required this.svgPath,
  });

  @override
  State<PatternButtonSvg> createState() => _PatternButtonSvgState();
}

class _PatternButtonSvgState extends State<PatternButtonSvg> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          opacity = 0.5;
        });
        widget.onTap();
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          opacity = 1.0;
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: opacity,
        child: SvgPicture.asset(widget.svgPath),
      ),
    );
  }
}