import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/controller/flight_route_list_controller.dart';
import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flight_ticket_booking_app/route/route_helper.dart';
import 'package:flight_ticket_booking_app/screens/bottom_bar.dart';
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flight_ticket_booking_app/helper/dependency.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<CustomerController>();
    Get.find<TripController>().getTripTokens();
    return GetBuilder<FlightRouteListController>(builder: (_){
      return GetBuilder<CustomerController>(builder: (_){
        return GetBuilder<TripController>(builder: (_){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialRoute: RouteHelper.getInitial(),
            getPages: RouteHelper.routes,
            theme: ThemeData(
              primaryColor: primary,
            ),
          );
        });
      });
    });

  }
}
