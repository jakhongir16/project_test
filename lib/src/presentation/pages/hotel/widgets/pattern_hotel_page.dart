import 'package:flutter/material.dart';
import 'package:project_task/src/data/models/model_hotel.dart';
import 'package:project_task/src/presentation/general_widgets/first_button.dart';
import 'package:project_task/src/presentation/general_widgets/hotel_section/lower_part_of_hotel.dart';
import 'package:project_task/src/presentation/general_widgets/hotel_section/upper_part_of_hotel.dart';

class PatternHotelPage extends StatelessWidget {
  final ModelHotel modelHotel;
  const PatternHotelPage({super.key,
  required this.modelHotel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UpperPartOfHotel(
            name: modelHotel.name,
            imageUrls: modelHotel.imageUrls,
            adress: modelHotel.name,
            minPrice: modelHotel.minPrice,
            priceForIt: modelHotel.priceForIt,
            rating: modelHotel.rating,
            ratingName: modelHotel.ratingName
        ),
        const SizedBox(
          height: 8,
        ),
        LowerPartOfHotel(aboutTheHotel: modelHotel.aboutTheHotel),
        const SizedBox(height: 12,),
        FirstButton(
            titleOfButton: 'К выбору номера',
            onPressed: (){
               Navigator.of(context).pushNamed(
                   '/numberPage', arguments: modelHotel.name,
               );
            })
      ],
    );
  }
}
