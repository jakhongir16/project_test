import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class HotelPrice extends StatelessWidget {
  const HotelPrice({super.key,
  required this.price,
  required this.priceText,
  });

  final int price;
  final String priceText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "от ${price.toLocaleCurrency()}",
          style: TextStylesOfPattern.textStyleBigPrice,
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Text(
            priceText.toLowerCase(),
            style: TextStylesOfPattern.greyTextStyle,
          ),
        ),
      ],
    );
  }
}

extension on int {
  String toLocaleCurrency() => "${NumberFormat("#,###", "ru_RU").format(this)} ₽";
}