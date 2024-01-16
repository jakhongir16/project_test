import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfo extends StatelessWidget {
  final String? leadingSvgPath;
  final String? trailingSvgPath;
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;

  const CardInfo({
    super.key,
    this.leadingSvgPath,
    this.trailingSvgPath,
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 5, bottom: 5, left: 10, right: trailingSvgPath == null ? 5 : 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IntrinsicWidth(
        child: Row(
          children: [
            if (leadingSvgPath != null) ...[
              SvgPicture.asset(leadingSvgPath!),
              const SizedBox(
                width: 2,
              ),
            ],
            Text(text, style: textStyle),
            if (trailingSvgPath != null) ...[
              const SizedBox(
                width: 2,
              ),
              SvgPicture.asset(trailingSvgPath!),
            ]
          ],
        ),
      ),
    );
  }
}