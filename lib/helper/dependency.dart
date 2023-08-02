

import 'package:flight_ticket_booking_app/apiconfiguration/api_client.dart';
import 'package:flight_ticket_booking_app/constants/app_url_constants.dart';
import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/controller/flight_route_list_controller.dart';
import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flight_ticket_booking_app/repository/customer_repository.dart';
import 'package:flight_ticket_booking_app/repository/flight_route_list_repository.dart';
import 'package:flight_ticket_booking_app/repository/trip_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init()async{
  //sharedpreference initialization
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  
  //api client initialization
  Get.lazyPut(() => ApiClient(appBaseUrl: AppUrlConstant.BASE_URL));
  
  //repositories
  Get.lazyPut(() => CustomerRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => FlightRouteListRepository(apiClient: Get.find()));
  Get.lazyPut(() => TripRepository(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => CustomerController(customerRepository: Get.find()));
  Get.lazyPut(() => FlightRouteListController(flightRouteListRepository: Get.find()));
  Get.lazyPut(() => TripController(tripRepository: Get.find()));
  
  
}