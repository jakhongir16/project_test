import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_task/src/core/assistance/accommodation_api.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/bloc/booking_bloc/booking_bloc.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/cellphone_textfield.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/center_selection_ordering.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/email_textfield.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/info_about_customer.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/ordering_cost_selection.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/pattern_field_text.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/traveler_selection.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/upper_ordering_part.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_button_blue.dart';

class BookingPage extends StatefulWidget {

  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final bookingRoomBloc = BookingBloc(AccommodationApi(Dio()));
  final List<GlobalKey<PatternTextFieldState>> keys = [];
  final GlobalKey<EmailTextFieldState> emailTextFieldKey = GlobalKey();
  final GlobalKey<CellPhoneTextFieldState> cellPhoneTextFieldKey = GlobalKey();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController cellPhoneTextController = TextEditingController();
  bool isError = false;


  @override
  void initState() {
    bookingRoomBloc.add(BookingLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    bookingRoomBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        title: const Text('Бронирование',
        textAlign: TextAlign.center,
        style: TextStylesOfPattern.bookingAppBarStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xF0F6F6F9),
      body: BlocBuilder<BookingBloc, BookingState>(
        bloc: bookingRoomBloc,
        builder: (context, state){
          if(state is BookingLoadedState){
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 8,),
                UpperOrderingPart(orderingPattern: state.bookingRoom),
                const SizedBox(height: 8,),
                CenterSelectionBooking(orderingComponent: state.bookingRoom),
                const SizedBox(height: 8,),
                InfoAboutCustomer(
                    emailTextController: emailTextController,
                    cellPhoneFieldKey: cellPhoneTextFieldKey,
                    cellPhoneTextController: cellPhoneTextController,
                    emailTextFieldKey: emailTextFieldKey),
               const SizedBox(height: 8,),
               TravelerSelection(keys: keys),
               const SizedBox(height: 8,),
                OrderingCostSelection(orderingPattern: state.bookingRoom),
                const SizedBox(height: 8,),
                if(isError)
                  const Center(
                    child: Text(
                      'Все поля должны быть заполнены',
                      style: TextStylesOfPattern.errorTextStyle,
                    ),
                  ),
               const SizedBox(
                  height: 8,
                ),
                PatternButtonBlue(
                    titleOfButton: 'Оплатить ${(state.bookingRoom.tour_price + state.bookingRoom.fuel_charge + state.bookingRoom.service_charge).toLocaleCurrency()}',
                    onPressed: (){
                      isError = false;
                      for(var key in keys){
                        if(key.currentState?.checkText() ?? true){
                          isError = true;
                        }
                      }
                      if(emailTextController.text.isEmpty){
                        isError = true;
                        emailTextFieldKey.currentState?.isError = true;
                      }
                      if(cellPhoneTextController.text.isEmpty){
                        isError = true;
                        cellPhoneTextFieldKey.currentState?.isError = true;
                      }
                      setState(() {
                        if(!isError){
                          Navigator.of(context).pushNamed('/paymentPage');
                        }
                      });
                    })
              ],
            );
          } else if(state is BookingLoadingError){
            return const Placeholder();
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

extension on int {
  String toLocaleCurrency() => "${NumberFormat("#,###", "ru_RU").format(this)} ₽";
}