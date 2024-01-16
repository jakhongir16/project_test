import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget ratingConstruction(int rating, String ratingName) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: const Color(0xFFFFC700).withOpacity(0.2),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          SvgPicture.asset(
            'assets/icons/Icons.svg',
            height: 15,
            width: 15,
          ),
         Text('$rating $ratingName',
          style: const TextStyle(
            color: Color(0xFFFFA800),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
         )
      ],
    ),
  );
}
