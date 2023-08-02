
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flight_ticket_booking_app/screens/ticket_view.dart';
import 'package:flight_ticket_booking_app/utils/app_info_list.dart';
import 'package:flight_ticket_booking_app/utils/app_layout.dart';
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flight_ticket_booking_app/widgets/app_column_layout.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flight_ticket_booking_app/widgets/app_ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../widgets/app_layout_builder_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return GetBuilder<TripController>(builder: (tripController){
      return !tripController.isLoading?Scaffold(
        backgroundColor: Styles.bgColor,
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(20),horizontal: AppLayout.getHeight(20)),
              children: [
                Gap(40),
                Text("Ticket",style: Styles.headLineStyle1,),
                Gap(20),
                const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
                Gap(20),
                Container(
                    padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                    child: TicketView(
                      takeOffLocation:tripController.getTripInfo.takeOffLocation!,
                      takeOffLocationAbbreviation: tripController.getTripInfo.routeModel!.takeOffAbbreviation!,
                      destination: tripController.getTripInfo.destination!,
                      destinationAbbreviation: tripController.getTripInfo.routeModel!.destinationAbbreviation!,
                      tripHour: tripController.getTripInfo.routeModel!.flightDuration!,
                      tripDate: tripController.getTripInfo.tripDate!,
                      departureTime: tripController.getTripInfo.routeModel!.takeOffTime!,
                      arrivalTime: tripController.getTripInfo.routeModel!.arrivalTime!,
                      seatNumber: tripController.getTripInfo.seatNumber.toString(),
                      pilotName: tripController.getTripInfo.pilotName!,
                      planeNumber: tripController.getTripInfo.airplaneNumber!,
                      passengerName: tripController.getTripInfo.customerModel!.name!,
                      isColor: true,)
                ),
                SizedBox(height: 1,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    children: [
                      Gap(15),
                      const AppLayoutBuilderWidget(sections:15,isColor: false,width: 5,),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/visa.png",scale: 11,),
                                  Text(" *** 2462",style: Styles.headLineStyle3,)
                                ],
                              ),
                              const Gap(5),
                              Text("Payment Method",style: Styles.headLineStyle4,)
                            ],
                          ),
                           AppColumnLayout(firsText: "Ticket Price",
                            secondText: tripController.getTripInfo.price!.toString(),
                            alignment: CrossAxisAlignment.end,isColor: true,),

                        ],
                      ),
                      const SizedBox(height: 1,),
                      const Gap(15)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(AppLayout.getHeight(21)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(21))
                      )
                  ),
                  padding:  EdgeInsets.only(top: AppLayout.getHeight(20),bottom: AppLayout.getHeight(20)),
                  margin:  EdgeInsets.only(left: AppLayout.getHeight(15),right: AppLayout.getHeight(15)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                      child: BarcodeWidget(
                        data: 'https://github.com/martinovovo',
                        barcode: Barcode.code128(),
                        color: Styles.textColor,
                        drawText: false,
                        width: double.infinity,
                        height: 70,),

                    ),

                  ),


                ),
                const SizedBox(height: 1,),
                Gap(20),
                // Container(
                //   padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                //   child: TicketView(ticket: ticketList[0],),
                // ),
              ],
            ),
            Positioned(
              left: AppLayout.getHeight(22),
              top: AppLayout.getHeight(295),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Styles.textColor,width: 2)
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                ),
              ),
            ),
            Positioned(
              right: AppLayout.getHeight(22),
              top: AppLayout.getHeight(295),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Styles.textColor,width: 2)
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                ),
              ),
            ),
          ],
        ),
      ):AppCustomLoader();
    });
  }
}
