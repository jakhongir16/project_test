import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_task/src/core/assistance/accommodation_api.dart';
import 'package:project_task/src/data/models/model_hotel.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final AccommodationApi accommodationApi;

  HotelBloc(this.accommodationApi) : super(HotelStarter()) {
    on<HotelLoadEvent>((event, emit) async {
      try{
        emit(HotelLoading());
        var notMotel = await accommodationApi.receiveHotel();
        emit(HotelLoaded(hotel: notMotel));
      } catch (e) {
        emit(HotelError(e));
      }
      });
  }
}