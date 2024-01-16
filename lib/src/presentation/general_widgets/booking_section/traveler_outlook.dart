import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/pattern_field_text.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_button_svg.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class TravelerOutlook extends StatefulWidget {
  const TravelerOutlook({
    super.key,
    required this.travelerDigit,
    required this.keys,
  });

  final List<GlobalKey<PatternTextFieldState>> keys;
  final int travelerDigit;

  @override
  State<TravelerOutlook> createState() => _TravelerOutlookState();
}

class _TravelerOutlookState extends State<TravelerOutlook> {
  bool isOpen = true;
  final squares = const {
    0: "Имя",
    1: "Фамилия",
    2: "Дата рождения",
    3: "Гражданство",
    4: "Номер загранпаспорта",
    5: "Cрок действия загранпаспорта"
  };

  String digitToLetterRu(int digit) {
    switch (digit) {
      case 1:
        return 'Первый';
      case 2:
        return 'Второй';
      case 3:
        return 'Третий';
      case 4:
        return 'Четвёртый';
      case 5:
        return 'Пятый';
      default:
        return '$digit';
    }
  }

  final checkers =
      List<TextEditingController>.generate(6, (_) => TextEditingController());

  final List<bool> isError = List.filled(6, false);

  final keys = List<GlobalKey<PatternTextFieldState>>.generate(
    6,
    (_) => GlobalKey<PatternTextFieldState>(),
  );

  @override
  void initState() {
    super.initState();
    widget.keys.addAll(keys);
  }

  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              '${digitToLetterRu(widget.travelerDigit)} турист',
              style: TextStylesOfPattern.blackTextStyle,
            ),
            const Spacer(),
            Transform.rotate(
               angle: isOpen ? 0 : pi,
                child: PatternButtonSvg(
                  onTap: (){
                    setState(() {
                      isOpen = !isOpen;
                    });
                  }, svgPath: 'assets/icons/blue_arrow_forward_vertical.svg',
                ),
                ),
          ],
        ),
        Visibility(
            maintainState: true,
            visible: isOpen,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                children: squares.keys.map((key){
                  return Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      PatternTextField(
                          labelText: squares[key]!,
                          fieldKey: keys[key],
                          controller: checkers[key],
                          isError: isError[key],
                          onErrorChanged: (value){
                             setState(() {
                               isOpen = true;
                               isError[key] = value;
                             });
                          })
                    ],
                  );
                }).toList(),
              ),
            ))
      ],
    ));
  }
}
