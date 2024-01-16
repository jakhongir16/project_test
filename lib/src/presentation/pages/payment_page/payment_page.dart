import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_app_bar.dart';
import 'package:project_task/src/presentation/general_widgets/payment_section/congratulation_icon.dart';
import 'package:project_task/src/presentation/general_widgets/payment_section/final_button.dart';

class PaymentPage extends StatelessWidget {
 const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int digitOfRandom = Random().nextInt(999999);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PatternAppBar(
        label: 'Заказ оплачен',
      ),
      body: Column(
        children: [
          Expanded(
            child: Material(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal:  23
                  ),
                  child: Column(
                    children: [
                     const SizedBox(height: 122,),
                     const CongratulationIcon(),
                     const SizedBox(height: 32,),
                     Text(
                       'Ваш заказ принят в работу',
                        style: TextStylesOfPattern.blackTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                     ),
                     const SizedBox(height: 22,),
                     Text(
                       'Подтверждение заказа №$digitOfRandom может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                       textAlign: TextAlign.center,
                       style: TextStylesOfPattern.greyTextStyle,
                     ),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FinalButton(
          titleOfButton: 'Супер!',
          onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/', (Route<dynamic> route) => false);
          }),
    );
  }
}
