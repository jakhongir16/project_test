import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_button_svg.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class InsertOutlookTraveler extends StatelessWidget {
  final VoidCallback onTap;

  const InsertOutlookTraveler({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Добавить туриста',
              style: TextStylesOfPattern.blackTextStyle,
            ),
            PatternButtonSvg(
                onTap: onTap,
                svgPath: 'assets/icons/add_button.svg'),
          ],
        ));
  }
}
