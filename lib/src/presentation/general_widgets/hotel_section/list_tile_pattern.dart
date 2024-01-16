import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class ListTilePattern extends StatelessWidget {
  const ListTilePattern({super.key,
  required this.titleList,
  required this.subTitleList,
  required this.pathOfSvg,
  });
  final String titleList;
  final String subTitleList;
  final String pathOfSvg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleList,
        style: TextStylesOfPattern.blackTextStyle.copyWith(fontSize: 16),
      ),
      subtitle: Text(
        subTitleList,
        style: TextStylesOfPattern.greyTextStyle.copyWith(fontSize: 14),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 6, left: 15),
        child: SvgPicture.asset(pathOfSvg),
      ),
      trailing: SvgPicture.asset(
        'assets/icons/arrow_left.svg',
        height: 24,
        width: 24,
      ),
    );
  }
}


// Material(
// color: const Color(0xFFFBFBFC),
// borderRadius: const BorderRadius.all(
// Radius.circular(15)
// ),
// child: ListTile(
//
// leading: Padding(
// padding: const EdgeInsets.only(top: 0, left: 15),
// child: SvgPicture.asset(
// 'assets/icons/emoji-happy.svg',
// width: 24,
// height: 24,
// ),
// ),
// title: Row(
// children: [
// const Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Удобства',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w400,
// fontFamily: 'SF Pro Display',
// height: 19.2 / 16),
// ),
// SizedBox(height: 2,),
// Text(
// 'Самое необходимое',
// style: TextStyle(
// fontSize: 14,
// color: Colors.grey,
// fontWeight: FontWeight.w400,
// fontFamily: 'SF Pro Display',
// height: 19.2 / 16),
// ),
// ],
// ),
// Flexible(
// child: Padding(
// padding: const EdgeInsets.only(left: 140),
// child: SvgPicture.asset(
// 'assets/icons/arrow_left.svg',
// height: 24,
// width: 24,
// ),
// ),
// ),
// ],
// ),
// subtitle:  const SizedBox(
// width: 275,
// child: Divider(
// ),
// ),
//
// ),
// ),