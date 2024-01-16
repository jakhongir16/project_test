
import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/card_info.dart';
import 'package:project_task/src/presentation/general_widgets/card_info_second.dart';
import 'package:project_task/src/presentation/general_widgets/carousel_image_construction.dart';
import 'package:project_task/src/presentation/general_widgets/hotel_price_second.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';
import 'package:project_task/src/presentation/general_widgets/second_button.dart';
import 'package:project_task/src/presentation/pages/booking_page/booking_page.dart';

class GeneralPatternView extends StatelessWidget {
  const GeneralPatternView({super.key,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls
  });

  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: PatternContainerRounded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselImageConstruction(imageUrls: imageUrls),
              const SizedBox(
                height: 8,
              ),
              Text(
                name,
                style: TextStylesOfPattern.blackTextStyle,
              ),
              const SizedBox(height: 8,),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: peculiarities.map((text){
                  return CardInfo(
                    text: text,
                    textStyle: TextStylesOfPattern.greyTextStyle,
                    backgroundColor: const Color(0xFFFBFBFC),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: (){},
                child: CardInfoSecond(
                  text: "Подробнее о номере ",
                  textStyle: TextStylesOfPattern.greyTextStyle.copyWith(
                    color: const Color(0xFF0D72FF),
                  ),
                  backgroundColor: const Color(0x1A0D72FF),
                  trailingSvgPath: 'assets/icons/blue_arrow_forward_ios.svg',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HotelPriceSecond(
               price: price,
               priceText: pricePer,
              ),
              const SizedBox(
                height: 16,
              ),
              SecondButton(
                  title: "Выбрать номер",
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingPage()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
