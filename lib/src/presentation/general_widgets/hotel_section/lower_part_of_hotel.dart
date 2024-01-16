import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/hotel_section/list_tile_pattern.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class LowerPartOfHotel extends StatelessWidget {
  final Map<String, dynamic> aboutTheHotel;
  const LowerPartOfHotel({super.key,
  required this.aboutTheHotel
  });

  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Об отеле',
              style: TextStylesOfPattern.aboutHotelStyle,
            ),
            const SizedBox(height: 16,),
            Column(
              children: List.generate(
                  (aboutTheHotel['peculiarities'].length / 2).ceil(), (index) {
                final pecFirst =
                aboutTheHotel['peculiarities'].elementAt(index * 2);
                final pecSecond = (index * 2 + 1 <
                    aboutTheHotel['peculiarities'].length)
                    ? aboutTheHotel['peculiarities'].elementAt(index * 2 + 1)
                    : null;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 8,
                        child: Chip(
                          backgroundColor: const Color(0xFFFBFBFC),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: Colors.grey,
                          ),
                          label: Text(
                            pecFirst,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          // child: Text(
                          //
                          // ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      if (pecSecond != null)
                        Flexible(
                          flex: 0,
                          child: Chip(
                            backgroundColor: const Color(0xFFFBFBFC),
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              color: Colors.grey,
                            ),
                            label: Text(
                              pecSecond,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            // child: Text(
                            //
                            // ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 12),
            Opacity(
              opacity: 0.9,
              child: Text(
                aboutTheHotel["description"],
                style: TextStylesOfPattern.textStyleRegularBlack,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
           const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFFBFBFC),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )
                  ),
              child:  Column(
                children: [
                  ListTilePattern(
                      titleList: 'Удобства',
                      subTitleList: 'Самое необоходимое',
                      pathOfSvg: 'assets/icons/emoji-happy.svg'
                  ),
                  Divider(
                    indent: 53,
                    color: Color(0x26828796),
                    height: 0,
                  ),
                  ListTilePattern(
                      titleList: 'Что включено',
                      subTitleList: 'Самое необоходимое',
                      pathOfSvg: 'assets/icons/tick-square.svg',
                  ),
                  Divider(
                    indent: 53,
                    color: Color(0x26828796),
                    height: 0,
                  ),
                  ListTilePattern(
                    titleList: 'Что не включено',
                    subTitleList: 'Самое необоходимое',
                    pathOfSvg: 'assets/icons/close-square.svg',
                  ),
                  Divider(
                    indent: 53,
                    color: Color(0x26828796),
                    height: 0,
                  ),
                ],
              ),
                ),


          ],
        ));
  }
}
