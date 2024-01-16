import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/src/core/assistance/accommodation_api.dart';
import 'package:project_task/src/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:project_task/src/presentation/pages/hotel/widgets/pattern_hotel_page.dart';

class HotelPage extends StatefulWidget {

  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final hotelBloc = HotelBloc(AccommodationApi(Dio()));

  @override
  void initState() {
    hotelBloc.add(HotelLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    hotelBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xF0F6F6F9),
        title: const Text(
          'Отель',
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xF0F6F6F9),
      body: BlocBuilder<HotelBloc, HotelState>(
          bloc: hotelBloc,
          builder: (context, state) {
           if(state is HotelLoaded){
             return PatternHotelPage(
                 modelHotel: state.hotel
             );
           } else if(state is HotelErrorLoadingError) {
             return const SizedBox();
           } else {
             return const Center(
               child: CircularProgressIndicator.adaptive(),
             );
           }
          }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:
    );
  }

  }

