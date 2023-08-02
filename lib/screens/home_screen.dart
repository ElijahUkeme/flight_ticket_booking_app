import 'package:flight_ticket_booking_app/screens/hotel_screen.dart';
import 'package:flight_ticket_booking_app/screens/ticket_view.dart';
import 'package:flight_ticket_booking_app/utils/app_info_list.dart';
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flight_ticket_booking_app/widgets/app_double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimension.width20),
            child: Column(

              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Good Morning", style: Styles.headLineStyle3,),
                         Gap(5),
                         Text("Book Tickets",style: Styles.headLineStyle1,),
                      ],
                    ),
                    Container(
                      height: Dimension.height30+Dimension.height20,
                      width: Dimension.width30+Dimension.width20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage("assets/images/img_1.png"),
                        )
                      ),
                    )
                  ],
                ),
                Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF4F6FD)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_search_regular,color: Color(0xFFBFC205)),
                      Text(
                        "Search"
                      )

                    ],
                  ),
                ),
                Gap(40),
               const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View all")
              ],
            ),
          ),
          Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: Dimension.width20),
            child: Row(
              //children: ticketList.map((ticket) => TicketView(ticket: ticket)).toList()
              children: ticketList.map((ticket) => TicketView(
                  takeOffLocation: ticket['from']['name'],
                  takeOffLocationAbbreviation: ticket['from']['code'],
                  destination: ticket['to']['name'],
                  destinationAbbreviation: ticket['from']['code'],
                  tripHour: ticket['flying_time'],
                  tripDate: ticket['date'],
                  departureTime: ticket['departure_time'],
                  arrivalTime: ticket['arrival_time'],
                  seatNumber: ticket['sit_number'],
                  pilotName: ticket['ticket_number'],
                  planeNumber: ticket['airplane_number'],
                  passengerName: ticket['passenger_name'])).toList(),
            ),
          ),
          Gap(15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimension.width20),
            child: const AppDoubleTextWidget(bigText: "Hotels", smallText: "View all")
          ),
          Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: Dimension.width20),
            child:Row(
              children:hotelList.map((hotel) =>HotelScreen(hotel: hotel)).toList()
            ),
          )

        ],
      ),
    );
  }
}
