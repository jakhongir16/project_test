import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class CostRow extends StatelessWidget {
  const CostRow({super.key,
  required this.title,
  required this.cost,
   this.isTotal = false,
  });

  final String title;
  final String cost;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
             title,
            style: TextStylesOfPattern.greyTextStyle,
          ),
          const Spacer(),
          Text(
            cost,
            style: isTotal ? TextStylesOfPattern.textStyleRegularBlack.copyWith(color: const Color(0xFF0D72FF))
                : TextStylesOfPattern.textStyleRegularBlack,
          ),
        ],
      ),
    );
  }

}

