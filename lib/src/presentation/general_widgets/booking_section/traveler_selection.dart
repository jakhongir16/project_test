import 'package:flutter/material.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/insert_outlook_traveler.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/pattern_field_text.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/traveler_outlook.dart';

class TravelerSelection extends StatefulWidget {
  const TravelerSelection({super.key, required this.keys});
  final List<GlobalKey<PatternTextFieldState>> keys;

  @override
  State<TravelerSelection> createState() => _TravelerSelectionState();
}

class _TravelerSelectionState extends State<TravelerSelection> {
  int travelerCalculate = 1;

  void insertTraveler(){
    setState(() {
      if(travelerCalculate != 5){
        travelerCalculate++;
      }
    });
  }

  void deleteTraveler(){
    setState(() {
      if(travelerCalculate != 5){
        travelerCalculate--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(var i = 0; i < travelerCalculate; i++)
          Column(
            children: [
              TravelerOutlook(
                  travelerDigit: i + 1,
                  keys: widget.keys,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        InsertOutlookTraveler(
            onTap: insertTraveler,
        )
      ],
    );
  }
}
