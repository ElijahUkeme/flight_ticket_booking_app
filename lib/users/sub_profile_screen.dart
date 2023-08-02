import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/screens/book_flight_sreen.dart';
import 'package:flight_ticket_booking_app/screens/search_screen.dart';
import 'package:flight_ticket_booking_app/auth/sign_up_screen.dart';
import 'package:flight_ticket_booking_app/users/profile_screen.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flight_ticket_booking_app/widgets/app_colors_widget.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flight_ticket_booking_app/widgets/app_icon_text_widget.dart';
import 'package:flight_ticket_booking_app/widgets/clipper_widget.dart';
import 'package:flight_ticket_booking_app/widgets/profile_column_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route_helper.dart';

class SubProfileScreen extends StatefulWidget {
  const SubProfileScreen({Key? key}) : super(key: key);

  @override
  _SubProfileScreenState createState() => _SubProfileScreenState();
}

class _SubProfileScreenState extends State<SubProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(builder: (customerController){
      return customerController.isUserLoggedIn()? Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: Stack(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height *0.4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:gradientColor,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                ),
              ),
            ),
            Positioned(
              top: Dimension.height40*3+Dimension.height30,
              right: Dimension.width30,
              left: Dimension.width30,
              bottom: Dimension.height30,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: Dimension.height40*2+Dimension.height10),
                    child: Column(
                      children: [
                        ElevatedButton(onPressed: (){
                          Get.toNamed(RouteHelper.getUserDetailsPage());
                        },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff8F6ED5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                )
                            ),
                            child: Container(
                                width: Dimension.width20*6,
                                height: Dimension.height20+Dimension.height15,
                                child: Center(
                                    child: Text("View Full Profile",style: TextStyle(
                                        fontWeight: FontWeight.bold),))
                            )
                        ),
                        //text data
                        Padding(
                          padding:  EdgeInsets.only(top: Dimension.height20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ProfileColumnWidget(firstText: customerController.customerModel.approvedTrip.toString(), secondText: "Approved Trips"),
                              ProfileColumnWidget(firstText: customerController.customerModel.cancelledTrip.toString(), secondText: "Cancelled"),
                              ProfileColumnWidget(firstText: customerController.customerModel.pendingTrip.toString(), secondText: "Pending")
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                              top: Dimension.height10,
                              bottom: Dimension.height10/2,
                              right: Dimension.width20,
                              left: Dimension.width20
                          ),
                          child: Divider(
                            thickness: 1,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          customerController.customerModel.name!,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff525F7F)
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          customerController.customerModel.address!,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff525F7F)
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          customerController.customerModel.phoneNumber!,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff525F7F)
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                              top: Dimension.height10,
                              bottom: Dimension.height10/2,
                              right: Dimension.width20,
                              left: Dimension.width20
                          ),
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.blueGrey,
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                            },
                            child: AppIconText(icon: Icons.airplane_ticket, text: "Check Ticket")),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookFlightScreen()));
                          },
                            child: AppIconText(icon: Icons.airplanemode_active, text: "Book A Flight")),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteHelper.getTripTokenPage());
                          },
                            child: AppIconText(icon: Icons.token, text: "View All Your Token"))
                      ],
                    )
                ),
              ),
            ),
            Positioned(
              top: Dimension.height40+Dimension.height30,
              left: MediaQuery.of(context).size.width /2-75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Container(
                      height: 150,
                      width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                                  fit: BoxFit.cover,
                                image:NetworkImage(customerController.customerModel.profileImage!) )
                          ),
                   )
                ),
              ),
          ],
        ),
      ):AppCustomLoader();
    });
  }
}
