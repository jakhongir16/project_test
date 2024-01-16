import 'package:flutter/material.dart';
import 'package:project_task/src/data/models/model_hotel.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_button_blue.dart';

class FinalButton extends StatelessWidget {
  const FinalButton({super.key,
    required this.titleOfButton,
    required this.onPressed
  });

  final String titleOfButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PatternButtonBlue(
      titleOfButton: titleOfButton,
      onPressed: onPressed,
    );
  }
}
