part of 'booking_bloc.dart';


class BookingState {}

class BookingStarter extends BookingState {}

class BookingLoadingState extends BookingState {}

class BookingLoadedState extends BookingState {
  final BookingRoom bookingRoom;
  BookingLoadedState({required this.bookingRoom});
}

class BookingLoadingError extends BookingState {}