import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project_task/src/core/assistance/accommodation_api.dart';
import 'package:project_task/src/data/models/screen_number.dart';
import 'package:project_task/src/data/models/screen_numbers.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final AccommodationApi accommodationApi;
  NumberBloc(this.accommodationApi) : super(NumberStarter()) {
    on<LoadNumberSpaceEvent>((event, emit) async {
      try{
        emit(NumberSpaceLoading());
        var numberHotel = await accommodationApi.receiveNumberHotel();
        emit(NumberSpaceLoaded(numberSpaceModel: numberHotel));
      } catch (e){
        emit(NumberSpaceErrorLoading());
      }
    });
  }
}
