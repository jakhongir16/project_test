part of 'hotel_bloc.dart';

class HotelState{}

class HotelStarter extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final ModelHotel hotel;
  HotelLoaded({required this.hotel});
}

class HotelError extends HotelState {
  final Object? error;
  HotelError(this.error);
}

class HotelErrorLoadingError extends HotelState {}
