import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratulationIcon extends StatelessWidget {
  const CongratulationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100)
      ),
      child: SizedBox(
        width: 44,
        height: 44,
        child: Image.asset(
          "assets/icons/party2.png",
        ),
      ),
    );
  }
}
