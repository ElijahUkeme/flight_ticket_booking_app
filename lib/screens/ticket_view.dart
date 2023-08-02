import 'package:flight_ticket_booking_app/utils/app_layout.dart';
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flight_ticket_booking_app/widgets/app_column_layout.dart';
import 'package:flight_ticket_booking_app/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../widgets/app_layout_builder_widget.dart';

class TicketView extends StatelessWidget {

  final String takeOffLocation;
  final String takeOffLocationAbbreviation;
  final String destination;
  final String destinationAbbreviation;
  final String tripHour;
  final String tripDate;
  final String departureTime;
  final String arrivalTime;
  final String seatNumber;
  final String pilotName;
  final String planeNumber;
  final String passengerName;

  final bool? isColor;
   const TicketView({Key? key,
  required this.takeOffLocation,
     required this.takeOffLocationAbbreviation,
     required this.destination,
     required this.destinationAbbreviation,
     required this.tripHour,
     required this.tripDate,
     required this.departureTime,
     required this.arrivalTime,
     required this.seatNumber,
     required this.pilotName,
     required this.planeNumber,
     required this.passengerName,
  this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid==true?269:271),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            /*
            this first container is responsible in showing the blue part of the ticket/card
             */
            Container(
              decoration:  BoxDecoration(
                color: isColor==null? Color(0xFF526799): Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),
                topRight: Radius.circular(AppLayout.getHeight(21)))
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(takeOffLocationAbbreviation,style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3,),
                      Expanded(child: Container()),
                      ThickContainer(isColor: true,),
                      Expanded(child: Stack(
                        children: [
                        SizedBox(
                          height: AppLayout.getHeight(24),
                          child:const AppLayoutBuilderWidget(sections:6),
                        ),
                          Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color: isColor==null?Colors.white: Color(0xFF8ACCF7),),)),
                        ],
                      )),

                      ThickContainer(isColor: true,),
                      Expanded(child: Container()),
                      Text(destinationAbbreviation,style: isColor==null?Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3,)
                    ],
                  ),
                  Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(takeOffLocation,style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,),
                      ),
                      Text(tripHour,style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(destination,textAlign: TextAlign.end,style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,),
                      ),
                    ],
                  )
                ],
              ),
            ),
            /*
            this other part is responsible in showing the orange part of the ticket/card
             */
            Container(
              color: isColor==null?Styles.orangeColor:Colors.white,
              child: Row(
                children:  [
                   SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                        color: isColor==null? Colors.white:Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          )
                        )),
                  ),
                  Expanded(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children:
                            List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
                              width: 5,height: 1,
                              child: DecoratedBox(
                                  decoration:BoxDecoration(
                                      color: isColor==null? Colors.white:Colors.grey.shade300
                                  ) ),
                            ))
                        );
                      },
                    ),
                  )),
                   SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: isColor==null? Colors.white:Colors.grey.shade300,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                            )
                        )),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: isColor==null?Styles.orangeColor:Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isColor==null?21:0),
                  bottomRight: Radius.circular(isColor==null?21:0)
                ),
              ),
              padding: EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                          AppColumnLayout(firsText: "Date", secondText: tripDate,
                              alignment: CrossAxisAlignment.start,isColor:isColor),
                          AppColumnLayout(firsText: "Departure Time", secondText: departureTime,
                              alignment: CrossAxisAlignment.center,isColor:isColor),
                      AppColumnLayout(firsText: "Arrival Time", secondText: arrivalTime,
                          alignment: CrossAxisAlignment.end,isColor:isColor),
                        ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firsText: "Pilot Name", secondText: pilotName,
                          alignment: CrossAxisAlignment.start,isColor:isColor),
                      AppColumnLayout(firsText: "Airplane Number", secondText: planeNumber,
                          alignment: CrossAxisAlignment.end,isColor:isColor),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firsText: "Passenger's Name", secondText: passengerName,
                          alignment: CrossAxisAlignment.start,isColor:isColor),
                      AppColumnLayout(firsText: "Sit Number", secondText: seatNumber,
                          alignment: CrossAxisAlignment.end,isColor:isColor),
                    ],
                  ),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
