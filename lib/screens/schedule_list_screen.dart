import 'package:flight_ticket_booking_app/controller/flight_route_list_controller.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/app_column_layout.dart';
import '../widgets/app_ticket_tabs.dart';

class ScheduleListScreen extends StatelessWidget {
  const ScheduleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    Get.find<FlightRouteListController>().getAllFlightRoute();
    return Scaffold(
        backgroundColor: Styles.kakiColor,
        body: Stack(
            children: [
        ListView(
        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(20),horizontal: AppLayout.getHeight(20)),
    children: [
    Gap(40),
    Center(child: Text("Our Schedule List",style: TextStyle(
      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26
    ))),
    Gap(20),
    const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
    Gap(20),
    Container(
    padding: EdgeInsets.only(left: AppLayout.getHeight(15),top: AppLayout.getHeight(10),bottom: AppLayout.getHeight(10),right: AppLayout.getHeight(10)),
              color:Color(0xff8F6ED5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  AppColumnLayout(firsText: "Flight", secondText: "Number",
                      alignment:CrossAxisAlignment.start),
                  Text(
                    "Route",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  ),
                  AppColumnLayout(firsText: "Departure", secondText: "Time",
                      alignment:CrossAxisAlignment.center),
                  AppColumnLayout(firsText: "Arrival", secondText: "Time",
                      alignment:CrossAxisAlignment.end),
                ],
                ),
    ),
        GetBuilder<FlightRouteListController>(builder: (_routeListController){
          return !_routeListController.isLoaded?Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21)
              ),
            ),
            padding: EdgeInsets.only(left: 16,top: 10,right: 10,bottom: 16),
            child: ListView.builder(
              itemCount: _routeListController.routeModelList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            "ELI${_routeListController.routeModelList[index].id!}",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          ),

                          AppColumnLayout(firsText: "${_routeListController.routeModelList[index].location} -", secondText: _routeListController.routeModelList[index].destination!,
                              alignment: CrossAxisAlignment.start),

                          Text(
                            _routeListController.routeModelList[index].takeOffTime!,style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          ),

                          Text(
                            _routeListController.routeModelList[index].arrivalTime!,style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          ),
                        ],
                      ),
                      Gap(15),
                    ],
                  ),
                );
              }),

          ):LinearProgressIndicator(
            color: Styles.bgColor,
          );

        })
                ])
            ])
    );
  }
}
