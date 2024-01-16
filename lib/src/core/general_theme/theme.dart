import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  fontFamily: "SF Pro Display",
  scaffoldBackgroundColor: const Color(0xFFF6F6F9),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      titleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
);

class TextStylesOfPattern {
  static const textStyleYellow = TextStyle(
    color: Color(0xFFFFA800),
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display'
  );

  static const blackTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display'
  );

  static const blueTextStyle = TextStyle(
    color: Color(0xFF0D72FF),
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display'
  );

  static const textStyleBigPrice = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro Display'
  );

  static const greyTextStyle = TextStyle(
    color: Color(0xFF828796),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display'
  );

  static const textStyleRegularBlack = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display'
  );

  static const textStylerRegularBlack = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display'
  );

  static const whiteButtonStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display'
  );
  static const hintStyle = TextStyle(
    color: Color(0xFFA8ABB6),
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display'
  );

  static const textFieldStyle = TextStyle(
    color: Color(0xFF14132A),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display'
  );

  static const errorTextStyle = TextStyle(
    color: Color.fromARGB(255, 161, 44, 36),
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro Display'
  );

  static const aboutHotelStyle = TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'SF Pro Display',
        height: 1.2,
  );

  static const bookingAppBarStyle = TextStyle(
  color: Colors.black,
  fontSize: 18, fontWeight: FontWeight.w500,
  fontFamily: 'SF Pro Display',
  );
}
