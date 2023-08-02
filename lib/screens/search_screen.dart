import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/app_double_text_widget.dart';
import '../widgets/app_search_text_field.dart';
import '../widgets/app_ticket_tabs.dart';
import '../widgets/double_icon_text_widget.dart';
import 'package:get/get.dart';
import 'package:flight_ticket_booking_app/route/route_helper.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tokenController = TextEditingController();

    final size = AppLayout.getSize(context);
    return GetBuilder<TripController>(builder: (_tripController){
      return !_tripController.isLoading?Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20),
              vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "What are\nYou Looking for",
              style: Styles.headLineStyle1.copyWith(fontSize: 35),
            ),
            Gap(AppLayout.getHeight(20)),
            const AppTicketTabs(firstTab: "Airline tickets", secondTab: "Hotels"),
            Gap(AppLayout.getHeight(25)),
            const DoubleIconTextWidget(
                firstIcon: Icons.flight_takeoff_rounded,
                firstText: "Departure",
                secondIcon: Icons.flight_land_rounded,
                secondText: "Arrival"),
            Gap(AppLayout.getHeight(15)),
            AppSearchTextField(
                textEditingController: tokenController,
                textHint: "Type your trip token here",
                icon: Icons.flight_land_rounded),
            // AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
            Gap(AppLayout.getHeight(35)),
            GestureDetector(
              onTap: () {
                _searchTicket(tokenController.text, _tripController);
                print("You are tapped");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppLayout.getHeight(12),
                    horizontal: AppLayout.getWidth(12)),
                decoration: BoxDecoration(
                    color: Color(0x891138CE),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                      "Find Tickets",
                      style: Styles.textStyle
                          .copyWith(color: Colors.white, fontSize: 20),
                    )),
              ),
            ),
            Gap(AppLayout.getHeight(35)),
            const AppDoubleTextWidget(
                bigText: "Upcoming Flights", smallText: "View all"),
            Gap(AppLayout.getHeight(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(15),
                      vertical: AppLayout.getHeight(15)),
                  height: AppLayout.getHeight(385),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 1,
                            spreadRadius: 1)
                      ]),
                  width: size.width * 0.42,
                  child: Column(
                    children: [
                      Container(
                        height: AppLayout.getHeight(190),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/sit.jpg"))),
                      ),
                      Gap(AppLayout.getHeight(12)),
                      Text(
                        "20% discount on Early booking of this Flight. Don't miss out this chance",
                        style: Styles.headLineStyle3,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppLayout.getHeight(15),
                              vertical: AppLayout.getHeight(15)),
                          width: size.width * 0.44,
                          height: AppLayout.getHeight(170),
                          decoration: BoxDecoration(
                            color: Color(0xFF3AB8B8),
                            borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(18)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discount\nfor survey",
                                style: Styles.headLineStyle2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Text(
                                "Take a Survey about our Services and get Discount",
                                style: Styles.headLineStyle3.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: -25,
                            top: -20,
                            child: Container(
                              padding: EdgeInsets.all(AppLayout.getWidth(30)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 12, color: Color(0xFF189999)),
                                  color: Colors.transparent),
                            ))
                      ],
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Container(
                      width: size.width * 0.44,
                      height: AppLayout.getHeight(200),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getHeight(15),
                          vertical: AppLayout.getHeight(15)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.orange),
                      child: Column(
                        children: [
                          Text(
                            "Take Love",
                            style: Styles.headLineStyle2.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ):AppCustomLoader();

    });

    }

  _searchTicket(String token, TripController tripController){
    if(!token.isEmpty){
      tripController.getTripInformation(token);
    }else{
      Get.snackbar("Warning", "Please paste your token",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.greenAccent,
          icon: Icon(Icons.warning_amber_rounded,color: Colors.redAccent,));
           return;

    }

  }
  }

