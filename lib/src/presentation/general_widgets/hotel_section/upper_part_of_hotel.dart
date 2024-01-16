import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/card_info.dart';
import 'package:project_task/src/presentation/general_widgets/carousel_image_construction.dart';
import 'package:project_task/src/presentation/general_widgets/hotel_price.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_button_title.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class UpperPartOfHotel extends StatelessWidget {
  final List<String> imageUrls;
  final String name;
  final String adress;
  final int minPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;

  const UpperPartOfHotel({
    super.key,
    required this.name,
    required this.adress,
    required this.minPrice,
    required this.priceForIt,
    required this.rating,
    required this.imageUrls,
    required this.ratingName,
});

  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        padding: const EdgeInsets.only(top: 5, bottom: 16, left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselImageConstruction(imageUrls: imageUrls),
            const SizedBox(height: 16,),
            CardInfo(
                leadingSvgPath: 'assets/icons/Icons.svg',
                text: "$rating $ratingName",
                textStyle: TextStylesOfPattern.textStyleYellow,
                backgroundColor: const Color(0x33FFC600),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: TextStylesOfPattern.blackTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            PatternButtonTitle(
                onTap: (){},
                child: Text(
                  adress,
                  style: TextStylesOfPattern.blueTextStyle,
                )
            ),
            HotelPrice(price: minPrice,
                priceText: priceForIt
            ),
          ],

        ));
  }
}
