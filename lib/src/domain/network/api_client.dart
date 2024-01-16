import 'package:project_task/src/data/models/model_hotel.dart';
import 'package:project_task/src/data/models/screen_numbers.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:chuck_interceptor/chuck.dart';
import 'package:project_task/src/core/constants/app_constants.dart';

part 'api_client.g.dart';

Chuck alice = Chuck(
   navigatorKey: rootNavigatorKey,
   showInspectorOnShake: true,
);

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
   factory ApiClient(Dio dio){
      return _ApiClient(dio);
   }


   @GET(AppConstants.hotelInfo)
   Future<ModelHotel> getHotelScreen();

   @GET(AppConstants.hotelNumber)
   Future<ScreenNumbers> getScreenNumber();

   // @GET(AppConstants.bookingRoom)
   // Future<BookingRoom> getBookingRoom();
}