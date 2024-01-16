// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:project_task/src/core/assistance/accommodation_api.dart';
// import 'package:project_task/src/data/models/model_hotel.dart';
// import 'package:project_task/src/presentation/bloc/hotel_bloc/hotel_bloc.dart';
// import 'package:project_task/src/presentation/general_widgets/first_button.dart';
// import 'package:project_task/src/presentation/pages/hotel/widgets/details_hotel_construction.dart';
// import 'package:project_task/src/presentation/pages/hotel/widgets/rating_construction.dart';
// import 'package:project_task/src/presentation/pages/hotel/widgets/smooth_indicator_construction.dart';
//
// class HotelPage extends StatefulWidget {
//   static const nameRoute = '/hotelPage';
//
//   const HotelPage({super.key});
//
//   @override
//   State<HotelPage> createState() => _HotelPageState();
// }
//
// class _HotelPageState extends State<HotelPage> {
//   final hotelBloc = HotelBloc(AccommodationApi(Dio()));
//   int imageChosen = 0;
//
//   String formatCurrency(double currency) {
//     return NumberFormat("#,###", "ru_RU").format(currency).replaceAll(',', ' ');
//   }
//
//   @override
//   void initState() {
//     hotelBloc.add(HotelLoadEvent());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xF0F6F6F9),
//         title: const Text(
//           'Отель',
//           style: TextStyle(
//             color: Color(0xFF000000),
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: const Color(0xF0F6F6F9),
//       body: BlocBuilder<HotelBloc, HotelState>(
//           bloc: hotelBloc,
//           builder: (context, state) {
//             if (state is HotelLoading) {
//               return const Center(child: CircularProgressIndicator.adaptive());
//             }
//             if (state is HotelLoaded) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     bodyConstruction(context, state.hotel),
//                     const SizedBox(height: 12,),
//                     Container(
//                       width: 410,
//                       height: 88,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(16),
//                             bottomRight: Radius.circular(16)),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 12,),
//                           FirstButton(modelHotel: state.hotel),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             if (state is HotelError) {
//               return const Center(child: Text('Error server. try again'));
//             }
//             return const SizedBox();
//           }),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       // floatingActionButton:
//     );
//   }
//
//   // SizedBox(
//   // width: 375,
//   // height: 40,
//   // child: Material(
//   // borderRadius: const BorderRadius.only(
//   // bottomLeft: Radius.circular(16),
//   // bottomRight: Radius.circular(16),
//   // ),
//   // color: Colors.white,
//   // child: ElevatedButton(
//   // onPressed: () => Navigator.push(context,
//   // MaterialPageRoute(builder: (_) => const NumberPage())),
//   // child: const Text("К выбору номера"),
//   // ),
//   // ),
//   // ),
//
//
//   // SizedBox(
//   //
//   //
//   // child: DecoratedBox(
//   // decoration: BoxDecoration(
//   //
//   // ),
//   // child: ElevatedButton(
//   // onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => const NumberPage())),
//   // child: const Text("К выбору номера"),
//   // ),
//   // ),
//   // ),
//
//   Widget bodyConstruction(BuildContext context, ModelHotel hotel) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(16)),
//                 color: Colors.white,
//               ),
//               child: detailsTourConstruction(context, hotel),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             DecoratedBox(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(16),
//                     topLeft: Radius.circular(16),
//                     bottomLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(16)),
//                 color: Colors.white,
//               ),
//               child: detailsHotelConstruction(context, hotel),
//             ),
//             // DecoratedBox(
//             //   decoration: const BoxDecoration(
//             //     borderRadius: BorderRadius.only(
//             //         bottomLeft: Radius.circular(16),
//             //         bottomRight: Radius.circular(16)),
//             //     color: Colors.white,
//             //   ),
//             //   child: detailsHotelConstruction(context, hotel),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget carouselImageConstruction(List<String> imageUrls) {
//     return CarouselSlider.builder(
//       itemCount: imageUrls.length,
//       itemBuilder: (_, index, __) => Container(
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//         child: Image.network(imageUrls[index],
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) =>
//             const Icon(Icons.error, size: 32)),
//       ),
//       options: CarouselOptions(
//         height: 257,
//         aspectRatio: 1.33,
//         viewportFraction: 1,
//         onPageChanged: (index, _) => setState(() => (imageChosen = index)),
//       ),
//     );
//   }
//
//   Widget detailsTourConstruction(BuildContext context, ModelHotel hotel) {
//     return Container(
//       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 carouselImageConstruction(hotel.imageUrls),
//                 Positioned.fill(
//                     bottom: 10,
//                     child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: smoothIndicatorConstruction(
//                           hotel.imageUrls.length, imageChosen),
//                     )),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ratingConstruction(hotel.rating, hotel.ratingName),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(hotel.name,
//                 style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                 )),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(hotel.adress,
//                 style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF0D72FF))),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Text('От ${formatCurrency(hotel.minPrice.toDouble())} ₽',
//                     style: const TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.w500)),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Text(hotel.priceForIt,
//                     style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFF828796))),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// Widget bodyConstruction(BuildContext context, ModelHotel hotel) {
//   return SafeArea(
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           DecoratedBox(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(16),
//                   bottomRight: Radius.circular(16)),
//               color: Colors.white,
//             ),
//             child: detailsTourConstruction(context, hotel),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           DecoratedBox(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(16),
//                   topLeft: Radius.circular(16),
//                   bottomLeft: Radius.circular(16),
//                   bottomRight: Radius.circular(16)),
//               color: Colors.white,
//             ),
//             child: detailsHotelConstruction(context, hotel),
//           ),
//           // DecoratedBox(
//           //   decoration: const BoxDecoration(
//           //     borderRadius: BorderRadius.only(
//           //         bottomLeft: Radius.circular(16),
//           //         bottomRight: Radius.circular(16)),
//           //     color: Colors.white,
//           //   ),
//           //   child: detailsHotelConstruction(context, hotel),
//           // )
//         ],
//       ),
//     ),
//   );
// }

// Wrap(
//   spacing: 8,
//   runSpacing: 8,
//   children: aboutTheHotel['peculiarites'].map<Widget>(
//       (text) {
//         return CardInfo(
//             text: text,
//             textStyle: CustomTextStyles.grayTextStyle,
//             backgroundColor: const Color(0xFFFBFBFC)
//         );
//       }
//   ).toList(),
// ),

// Widget carouselImageConstruction(List<String> imageUrls) {
//   return CarouselSlider.builder(
//     itemCount: imageUrls.length,
//     itemBuilder: (_, index, __) => Container(
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//       child: Image.network(imageUrls[index],
//           fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) =>
//           const Icon(Icons.error, size: 32)),
//     ),
//     options: CarouselOptions(
//       height: 257,
//       aspectRatio: 1.33,
//       viewportFraction: 1,
//       onPageChanged: (index, _) => setState(() => (imageChosen = index)),
//     ),
//   );
// }
//
// Widget detailsTourConstruction(BuildContext context, ModelHotel hotel) {
//   return Container(
//     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//     child: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               carouselImageConstruction(hotel.imageUrls),
//               Positioned.fill(
//                   bottom: 10,
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: smoothIndicatorConstruction(
//                         hotel.imageUrls.length, imageChosen),
//                   )),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           ratingConstruction(hotel.rating, hotel.ratingName),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(hotel.name,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//               )),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(hotel.adress,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF0D72FF))),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               Text('От ${formatCurrency(hotel.minPrice.toDouble())} ₽',
//                   style: const TextStyle(
//                       fontSize: 30, fontWeight: FontWeight.w500)),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text(hotel.priceForIt,
//                   style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF828796))),
//             ],
//           )
//         ],
//       ),
//     ),
//   );


// SizedBox(
// width: 375,
// height: 40,
// child: Material(
// borderRadius: const BorderRadius.only(
// bottomLeft: Radius.circular(16),
// bottomRight: Radius.circular(16),
// ),
// color: Colors.white,
// child: ElevatedButton(
// onPressed: () => Navigator.push(context,
// MaterialPageRoute(builder: (_) => const NumberPage())),
// child: const Text("К выбору номера"),
// ),
// ),
// ),


// SizedBox(
//
//
// child: DecoratedBox(
// decoration: BoxDecoration(
//
// ),
// child: ElevatedButton(
// onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => const NumberPage())),
// child: const Text("К выбору номера"),
// ),
// ),
// ),

