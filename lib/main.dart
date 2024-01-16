import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_task/src/presentation/pages/booking_page/booking_page.dart';
import 'package:project_task/src/presentation/pages/hotel/hotel_page.dart';
import 'package:project_task/src/presentation/pages/number/number_page.dart';
import 'package:project_task/src/presentation/pages/payment_page/payment_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HotelPage(),
        '/numberPage': (context) => const NumberPage(),
        '/bookingPage': (context) => const BookingPage(),
        '/paymentPage': (context) => const PaymentPage(),
      },
    );
  }
}


