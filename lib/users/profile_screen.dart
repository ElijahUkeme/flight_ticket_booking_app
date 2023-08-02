
import 'package:flight_ticket_booking_app/auth/sign_up_screen.dart';
import 'package:flight_ticket_booking_app/screens/flight_search_result_screen.dart';
import 'package:flight_ticket_booking_app/users/sub_profile_screen.dart';
import 'package:flight_ticket_booking_app/users/user_details_screen.dart';
import 'package:flight_ticket_booking_app/utils/app_layout.dart';
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flight_ticket_booking_app/widgets/app_column_layout.dart';
import 'package:flight_ticket_booking_app/widgets/app_layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),vertical: AppLayout.getHeight(20)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height: AppLayout.getHeight(86),
                width: AppLayout.getHeight(86),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/img_1.png"
                      ))
                ),
              ),
              Gap(AppLayout.getHeight(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Book A Ticket",style: Styles.headLineStyle1,
                  ),
                  Gap(AppLayout.getHeight(2)),
                  Text("New York",style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 14,color: Colors.grey.shade500
                  ),),
                  Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(200)),
                      color: const Color(0xFFFEF4F3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(3),vertical: AppLayout.getHeight(3)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF526799),
                            ),
                          child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                          color: Colors.white,size: 15,),
                        ),
                        Gap(AppLayout.getHeight(5)),
                        const Text("Premium Status",style: TextStyle(
                          color: Color(0xFF526799),fontWeight: FontWeight.w600
                        ),),
                        Gap(AppLayout.getHeight(5))
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      print("you are tapped");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetailsScreen()));
                    },
                      child: Text("Edit",style: Styles.textStyle.copyWith(color: Styles.textColor,fontWeight: FontWeight.w300),))
                ],
              )
            ],
          ),
          Gap(AppLayout.getHeight(8)),
          Divider(color: Colors.grey.shade300),
          Gap(AppLayout.getHeight(8)),
          Stack(
            children: [
              Container(
                height: AppLayout.getHeight(90),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(18))
                ),
              ),
              Positioned(
                right: -45,
                top: -40,
                child: Container(

                  padding: EdgeInsets.all(AppLayout.getHeight(30)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: Colors.transparent,
                    border: Border.all(width: 18,color: Color(0xFF264CD2))
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15),vertical: AppLayout.getHeight(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                      color: Styles.primaryColor,size: 27,),
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                    ),
                    Gap(AppLayout.getHeight(12)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You\'v got a new award",
                        style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
                        Text("You have 68 flights this year",
                          style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.9),fontSize: 16),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Gap(AppLayout.getHeight(25)),
          Text("Accumulated miles",style: Styles.headLineStyle2,),
          Gap(AppLayout.getHeight(15)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getWidth(18)),
              color: Styles.bgColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 10,
                  spreadRadius: 10,
                )
              ]
            ),
            child: Column(
              children: [
                Gap(AppLayout.getHeight(15)),
                Text(
                  "124563",style: TextStyle(
                  fontSize: 35,color: Styles.textColor,fontWeight: FontWeight.w600
                ),
                ),
                Gap(AppLayout.getHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles accrued",style: Styles.headLineStyle4.copyWith(fontSize: 16),),
                    Text("22 May 2022",style: Styles.headLineStyle4.copyWith(fontSize: 16),),
                  ],
                ),
                Gap(AppLayout.getHeight(4)),
                Divider(color: Colors.grey.shade300,),
                Gap(AppLayout.getHeight(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppColumnLayout(firsText: "23 0487",
                        secondText: "Miles",
                        alignment: CrossAxisAlignment.start,isColor: false,),
                    AppColumnLayout(firsText: "Airline CO",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end,isColor: false,)
                  ],
                ),
                Gap(AppLayout.getHeight(10)),
                const AppLayoutBuilderWidget(sections: 12,isColor: false,),
                Gap(AppLayout.getHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppColumnLayout(firsText: "24",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start,isColor: false,),
                    AppColumnLayout(firsText: "McDonald\s",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end,isColor: false,)
                  ],
                ),
                Gap(AppLayout.getHeight(10)),
                const AppLayoutBuilderWidget(sections: 12,isColor: false,),
                Gap(AppLayout.getHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppColumnLayout(firsText: "52 348",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start,isColor: false,),
                    AppColumnLayout(firsText: "NIMET",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end,isColor: false,)
                  ],
                )
              ],
            ),
          ),
          Gap(AppLayout.getHeight(15)),
        ],
      ),
    );
  }
}
