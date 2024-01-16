import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget smoothIndicatorConstruction(int count, int indexActive) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
    child: AnimatedSmoothIndicator(
      activeIndex: indexActive,
      count: count,
      effect: const SlideEffect(
        spacing: 5,
        radius: 5,
        dotWidth: 10,
        dotHeight: 10,
        paintStyle: PaintingStyle.fill,
        strokeWidth: 1.5,
        dotColor: Colors.black26,
        activeDotColor: Colors.black,
      ),
    ),
  );
}