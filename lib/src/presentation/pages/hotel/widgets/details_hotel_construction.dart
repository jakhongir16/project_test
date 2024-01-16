// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:project_task/src/data/models/model_hotel.dart';
//
// Widget detailsHotelConstruction(BuildContext context, ModelHotel hotel) {
//   return Container(
//   //  width: 375,
//     height: 520,
//     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//     child: Column(
//       children: [
//        const SizedBox(height: 16,),
//         const Padding(
//           padding: EdgeInsets.only(right: 280),
//           child: Text(
//             'Об отеле',
//             //textAlign: TextAlign.left,
//             style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'SF Pro Display',
//                 height: 1.2),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Column(
//           children: List.generate(
//               (hotel.aboutTheHotel.characteristics.length / 2).ceil(), (index) {
//             final pecFirst =
//                 hotel.aboutTheHotel.characteristics.elementAt(index * 2);
//             final pecSecond = (index * 2 + 1 <
//                     hotel.aboutTheHotel.characteristics.length)
//                 ? hotel.aboutTheHotel.characteristics.elementAt(index * 2 + 1)
//                 : null;
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Flexible(
//                     flex: 8,
//                     child: Chip(
//                       backgroundColor: const Color(0xFFFBFBFC),
//                       labelStyle: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         height: 1.2,
//                         color: Colors.grey,
//                       ),
//                       label: Text(
//                         pecFirst,
//                       ),
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                       ),
//                       // child: Text(
//                       //
//                       // ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   if (pecSecond != null)
//                     Flexible(
//                       flex: 0,
//                       child: Chip(
//                         backgroundColor: const Color(0xFFFBFBFC),
//                         labelStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           height: 1.2,
//                           color: Colors.grey,
//                         ),
//                         label: Text(
//                           pecSecond,
//                         ),
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         // child: Text(
//                         //
//                         // ),
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           }),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         SizedBox(
//           width: 410,
//           height: 80,
//           child: Text(
//             hotel.aboutTheHotel.description,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: Colors.black.withOpacity(0.8999999761581421),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Column(
//           children: [
//             Material(
//               color: const Color(0xFFFBFBFC),
//               borderRadius: const BorderRadius.all(
//                   Radius.circular(15)
//               ),
//               child: ListTile(
//
//                 leading: Padding(
//                   padding: const EdgeInsets.only(top: 0, left: 15),
//                   child: SvgPicture.asset(
//                     'assets/icons/emoji-happy.svg',
//                     width: 24,
//                     height: 24,
//                   ),
//                 ),
//                 title: Row(
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Удобства',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'SF Pro Display',
//                               height: 19.2 / 16),
//                         ),
//                         SizedBox(height: 2,),
//                         Text(
//                           'Самое необходимое',
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'SF Pro Display',
//                               height: 19.2 / 16),
//                         ),
//                       ],
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 140),
//                         child: SvgPicture.asset(
//                           'assets/icons/arrow_left.svg',
//                           height: 24,
//                           width: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 subtitle:  const SizedBox(
//                   width: 275,
//                   child: Divider(
//                   ),
//                 ),
//
//               ),
//             ),
//             Material(
//               color: const Color(0xFFFBFBFC),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(15),
//               ),
//               child: ListTile(
//                 leading: Padding(
//                   padding: const EdgeInsets.only(top: 0, left: 15),
//                   child: SvgPicture.asset(
//                     'assets/icons/tick-square.svg',
//                     width: 24,
//                     height: 24,
//                   ),
//                 ),
//                 title: Row(
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Что включено',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'SF Pro Display',
//                               height: 19.2 / 16),
//                         ),
//                         SizedBox(height: 2,),
//                         Text(
//                           'Самое необходимое',
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'SF Pro Display',
//                               height: 19.2 / 16),
//                         ),
//                       ],
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 140),
//                         child: SvgPicture.asset(
//                           'assets/icons/arrow_left.svg',
//                           height: 24,
//                           width: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 subtitle:  const SizedBox(
//                   width: 275,
//                   child: Divider(
//                   ),
//                 ),
//
//               ),
//             ),
//             Material(
//               color: const Color(0xFFFBFBFC),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(15),
//               ),
//               child: ListTile(
//                 leading: Padding(
//                   padding: const EdgeInsets.only(top: 0, left: 15),
//                   child: SvgPicture.asset(
//                     'assets/icons/close-square.svg',
//                     width: 24,
//                     height: 24,
//                   ),
//                 ),
//                 title: Row(
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Что не включено',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'SF Pro Display',
//                               height: 19.2 / 16),
//                         ),
//                         SizedBox(height: 2,),
//                         Text(
//                           'Самое необходимое',
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'SF Pro Display',
//                               height: 19.2 / 16),
//                         ),
//                       ],
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 140),
//                         child: SvgPicture.asset(
//                           'assets/icons/arrow_left.svg',
//                           height: 24,
//                           width: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 subtitle:  const SizedBox(
//                   width: 275,
//                   child: Divider(
//                   ),
//                 ),
//
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// // Column(
// // children: [
//
// // ],
// // );
