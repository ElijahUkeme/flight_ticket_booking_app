import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/route/route_helper.dart';
import 'package:flight_ticket_booking_app/users/profile_screen.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/book_flight_sreen.dart';
import '../screens/search_screen.dart';
import '../widgets/app_colors_widget.dart';
import '../widgets/app_icon_text_widget.dart';
import '../widgets/clipper_widget.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';

import '../widgets/profile_column_widget.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {

      return GetBuilder<CustomerController>(builder: (customerController){
        return customerController.isUserLoggedIn()?Container(
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //text data
                            Padding(
                              padding:  EdgeInsets.only(
                                  bottom: Dimension.height10/2,
                                  right: Dimension.width20,
                                  left: Dimension.width20
                              ),
                              child: Divider(
                                thickness: 0.5,
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
                            AppIconText(icon: Icons.email, text: customerController.customerModel.email!),

                            AppIconText(icon: Icons.calendar_today_outlined, text: customerController.customerModel.dateOfBirth!),
                            AppIconText(icon: Icons.person, text: customerController.customerModel.gender!),
                            AppIconText(icon: Icons.location_on, text: customerController.customerModel.localGovernment!),
                            AppIconText(icon: Icons.location_on, text: customerController.customerModel.stateOfOrigin!),
                            GestureDetector(
                                onTap: (){
                                  //logout from here
                                  print("logging out");
                                  customerController.clearSharedData();
                                  Get.toNamed(RouteHelper.initial);
                                },
                                child: AppIconText(icon: Icons.logout, text: "Logout"))
                          ],
                        ),
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
