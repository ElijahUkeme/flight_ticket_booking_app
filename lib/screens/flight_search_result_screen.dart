import 'package:date_picker_timeline/extra/dimen.dart';
import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/controller/flight_route_list_controller.dart';
import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flight_ticket_booking_app/model/book_trip_model.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../route/route_helper.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import '../widgets/app_column_layout.dart';
import '../widgets/app_icon_text_widget.dart';
import '../widgets/app_ticket_tabs.dart';
import '../widgets/double_icon_text_widget.dart';

class FlightSearchResultScreen extends StatefulWidget {
  const FlightSearchResultScreen({Key? key}) : super(key: key);

  @override
  _FlightSearchResultScreenState createState() => _FlightSearchResultScreenState();
}

class _FlightSearchResultScreenState extends State<FlightSearchResultScreen> {

  @override
  Widget build(BuildContext context) {
    String tripDate = Get.arguments["travelDate"];
    print("The trip date from the flight screen is "+tripDate);
    return GetBuilder<FlightRouteListController>(builder: (routeListController){
      return Scaffold(

          backgroundColor: Styles.bgColor,
          body:
          Container(
              margin: EdgeInsets.only(top: Dimension.height20*2),
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15),horizontal: AppLayout.getWidth(15)),
              child:
              GetBuilder<TripController>(builder: (tripController){
                return GetBuilder<CustomerController>(builder: (customerController){
                  return Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: routeListController.searchList.length,
                        itemBuilder: (context,index){

                          return GestureDetector(
                            onTap: (){

                              BookTripModel bookTripModel
                              = BookTripModel(routeId: routeListController.searchList[index].id,
                                  customerEmail: customerController.retrieveLoggedInUserEmail(),
                                  travelDate: tripDate);
                              print("The tapped trip id is "+bookTripModel.routeId.toString());
                              print("The tapped customer email is "+bookTripModel.customerEmail.toString());
                              print("The tapped trip date is "+bookTripModel.travelDate.toString());
                              //proceed to book a flight if and only if the user has logged in
                              customerController.isUserLoggedIn()?
                              _showAlertDialog(bookTripModel, tripController):
                                  _alertDialog();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Gap(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppColumnLayout(firsText: "Take-off Location", secondText: routeListController.searchList[index].location!,
                                        alignment: CrossAxisAlignment.start,isColor: true,),
                                      AppColumnLayout(firsText: "Destination", secondText: routeListController.searchList[index].destination!,
                                        alignment: CrossAxisAlignment.end,isColor: true,),
                                    ],
                                  ),
                                  Gap(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppColumnLayout(firsText: "Take-off Time", secondText: routeListController.searchList[index].takeOffTime!,
                                        alignment: CrossAxisAlignment.start,isColor: true,),
                                      AppColumnLayout(firsText: "Arrival Time", secondText: routeListController.searchList[index].arrivalTime!,
                                        alignment: CrossAxisAlignment.end,isColor: true,),
                                    ],
                                  ),
                                  Gap(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppColumnLayout(firsText: "Date", secondText: tripDate,
                                        alignment: CrossAxisAlignment.center,isColor: true,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                },);
              },)

          ));
    });
  }
  Future<void> _showAlertDialog(BookTripModel bookTripModel, TripController tripController)async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
      return  AlertDialog(
        title: Text("Confirm Booking"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Want to book this flight?"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: (){
                !tripController.isLoading?tripController.bookATrip(context, bookTripModel):AppCustomLoader();
                //Go ahead and book the flight
              },
              child: Text("Yes"),
          ),
          TextButton(
              onPressed: (){
                Get.back();
              },
              child: Text("No"))
        ],
      );
        });
  }

  Future<bool> _alertDialog()async{
    return await showDialog(
        context:context , builder: (BuildContext context){
      return AlertDialog(
        title: Text("Warning"),
        content: Text("You have not Login, Please Login First"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: (){
              Get.toNamed(RouteHelper.initial);
            },
            child: Text("Ok"),
          )
        ],
      );
    });
  }
}
