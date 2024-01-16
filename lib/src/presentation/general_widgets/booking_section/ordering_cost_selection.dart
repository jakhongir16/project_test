import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_task/src/data/models/booking_room.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/cost_row.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class OrderingCostSelection extends StatelessWidget {
  const OrderingCostSelection({super.key,
  required this.orderingPattern
  });

  final BookingRoom orderingPattern;
  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Column(
          children: [
            CostRow(
                title: 'Тур',
                cost: orderingPattern.tour_price.toLocalPrice(),
                ),
             CostRow(
                 title: 'Топливный сбор',
                 cost: orderingPattern.fuel_charge.toLocalPrice(),
             ),
             CostRow(
                 title: 'Сервисный сбор',
                 cost: orderingPattern.service_charge.toLocalPrice(),
             ),
             CostRow(title: 'К оплате',
                 cost: (orderingPattern.tour_price +
                        orderingPattern.fuel_charge +
                        orderingPattern.service_charge)
                        .toLocalPrice(),
             isTotal: true,
             ),
          ],
        ));
  }
}

extension on int {
  String toLocalPrice() => "${NumberFormat("#,###", "ru_RU").format(this)} ₽";
}
