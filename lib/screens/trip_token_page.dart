import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';

import '../widgets/app_column_layout.dart';

class TripTokenPage extends StatefulWidget {
  const TripTokenPage({Key? key}) : super(key: key);

  @override
  _TripTokenPageState createState() => _TripTokenPageState();
}

class _TripTokenPageState extends State<TripTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: Container(
            margin: EdgeInsets.only(top: Dimension.height20 * 2),
            padding: EdgeInsets.symmetric(
                vertical: AppLayout.getHeight(15),
                horizontal: AppLayout.getWidth(15)),
            child: GetBuilder<CustomerController>(builder: (customerController){
              return GetBuilder<TripController>(builder: (tripController){
                return customerController.isUserLoggedIn()?
                tripController.getTokens.length>0? Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: tripController.getTokens.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                  AppColumnLayout(
                                    firsText: "Date",
                                    secondText: tripController.getTokens[index].date!,
                                    alignment: CrossAxisAlignment.start,
                                    isColor: true,
                                  ),
                                  AppColumnLayout(
                                    firsText: "Time",
                                    secondText: tripController.getTokens[index].time!,
                                    alignment: CrossAxisAlignment.end,
                                    isColor: true,
                                  ),
                                ],
                              ),
                              Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppColumnLayout(
                                    firsText: "Token",
                                    secondText: tripController.getTokens[index].token!,
                                    alignment: CrossAxisAlignment.center,
                                    isColor: true,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                )
                    :Container(
                  child: const Center(
                    child: Text("You don't have any token yet",style:
                    TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.bold),),
                  ),
                ):Container(
                  child: const Center(
                    child: Text("You have not logged In",style:
                    TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.bold),),
                  ),
                );
              });
            }),
    )
    );
    }
}
