import 'package:flight_ticket_booking_app/utils/app_layout.dart';
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Hotel name is "+hotel["place"]);
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width*0.6,
      height: AppLayout.getHeight(350),
      padding: EdgeInsets.symmetric(horizontal: Dimension.width15,vertical: Dimension.width15),
      margin: EdgeInsets.only(right: Dimension.width15,top: Dimension.height15),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
            borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/${hotel['image']}"
                  ))
            ),
          ),
          Gap(10),
          Text(hotel['place'],style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
          Gap(5),
          Text(hotel['destination'],style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          Gap(8),
          Text("\$${hotel['price']}/Night",style: Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
          ),
        ],
      ),
    );
  }
}
