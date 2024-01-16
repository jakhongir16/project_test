import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/src/core/assistance/accommodation_api.dart';
import 'package:project_task/src/data/models/booking_room.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final AccommodationApi accommodationApi;
  BookingBloc(this.accommodationApi) : super(BookingStarter()) {
    on<BookingLoadEvent>((event, emit) async {
      try{
        emit(BookingLoadingState());
        final bookingImpl = await accommodationApi.receiveBookingRoom();
        emit(BookingLoadedState(bookingRoom: bookingImpl));
      } catch (e) {
        emit(BookingLoadingState());
      }
    });
  }
}
