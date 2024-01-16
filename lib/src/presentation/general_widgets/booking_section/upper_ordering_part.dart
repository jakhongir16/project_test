import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/data/models/booking_room.dart';
import 'package:project_task/src/presentation/general_widgets/card_info.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class UpperOrderingPart extends StatelessWidget {
  final BookingRoom orderingPattern;
  const UpperOrderingPart({super.key,
  required this.orderingPattern
  });

  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardInfo(
                leadingSvgPath: 'assets/icons/Icons.svg',
                text: '${orderingPattern.horating} ${orderingPattern.rating_name}',
                textStyle: TextStylesOfPattern.textStyleYellow,
                backgroundColor: const Color(0x33FFC600)
            ),
           const SizedBox(height: 8,),
            Text(
              orderingPattern.hotel_name,
              style: TextStylesOfPattern.blackTextStyle,
            ),
            Text(
              orderingPattern.hotel_adress,
              style: TextStylesOfPattern.blueTextStyle,
            ),
          ],
        ),
    );
  }
}
