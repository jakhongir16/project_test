import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/data/models/booking_room.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class CenterSelectionBooking extends StatelessWidget {
  final BookingRoom orderingComponent;

  const CenterSelectionBooking({super.key,
  required this.orderingComponent,
  });

  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Column(
          children: [
             orderingFeature('Вылет из', orderingComponent.departure),
             const SizedBox(height: 16,),
             orderingFeature('Страна, город', orderingComponent.arrival_country),
             const SizedBox(height: 16,),
             orderingFeature('Даты', '${orderingComponent.tour_date_start} - ${orderingComponent.tour_date_stop
             }'),
            const SizedBox(height: 16,),
            orderingFeature('Кол-во ночей', '${orderingComponent.number_of_nights} ночей'),
            const SizedBox(height: 16,),
            orderingFeature('Отель', orderingComponent.hotel_name),
            const SizedBox(height: 16,),
            orderingFeature('Номер', orderingComponent.room),
            const SizedBox(height: 16,),
            orderingFeature('Питание', orderingComponent.nutrition),
          ],
        ));
  }
  Widget orderingFeature(String title, String advice){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStylesOfPattern.greyTextStyle,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            advice,
            style: TextStylesOfPattern.textStyleRegularBlack,
          ),
        ),
      ],
    );
  }
}


