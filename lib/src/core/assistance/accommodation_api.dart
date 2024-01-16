import 'package:project_task/src/core/constants/app_constants.dart';
import 'package:project_task/src/data/models/booking_room.dart';
import 'package:project_task/src/data/models/model_hotel.dart';
import 'package:project_task/src/data/models/screen_number.dart';
import 'package:project_task/src/data/models/screen_numbers.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'accommodation_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)

abstract class AccommodationApi {
   factory AccommodationApi(Dio dio, {String baseUrl}) = _AccommodationApi;

   @GET(AppConstants.hotelInfo)
   Future<ModelHotel> receiveHotel();

   @GET(AppConstants.hotelNumber)
   Future<ScreenNumbers> receiveNumberHotel();

   @GET(AppConstants.bookingRoom)
   Future<BookingRoom> receiveBookingRoom();
}