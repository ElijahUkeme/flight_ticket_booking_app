import 'package:flight_ticket_booking_app/controller/flight_route_list_controller.dart';
import 'package:flight_ticket_booking_app/screens/schedule_list_screen.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flight_ticket_booking_app/widgets/my_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../auth/sign_up_screen.dart';
import '../widgets/app_colors_widget.dart';
import '../widgets/app_small_texts.dart';
import '../widgets/app_text_field.dart';
import '../widgets/clipper_widget.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flight_ticket_booking_app/widgets/big_texts.dart';
import 'package:get/get.dart';

class BookFlightScreen extends StatefulWidget {
  const BookFlightScreen({Key? key}) : super(key: key);

  @override
  _BookFlightScreenState createState() => _BookFlightScreenState();
}

class _BookFlightScreenState extends State<BookFlightScreen> {

  DateTime _selectedDate = DateTime.now();
  DateFormat df = DateFormat("yyyy-MM-dd");
  String _selectedLocation = "";
  String _selectedDestination = "";
  String _selectedFlightType = "";
  List<String> _locationList = [
    "Abuja",
    "Lagos",
    "Calabar",
    "Uyo",
    "Portharcourt"
  ];

  List<String> _destinationList = [
    "Abuja",
    "Lagos",
    "Calabar",
    "Uyo",
    "Portharcourt"
  ];

  List<String> _flightTypList = [
    "Economy",
    "Business",
    "First Class"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightRouteListController>(builder: (routeController){
      return !routeController.isLoaded?Container(
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
                top: Dimension.height40*2,
                right: Dimension.width30,
                left: Dimension.width30,
                bottom: Dimension.height40,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimension.radius20/2)),
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: Dimension.height30),
                    padding: EdgeInsets.only(top: Dimension.height40),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BigTexts(text: "Book A Flight",size: 35,color: Color(0xff8F6ED5),)
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimension.height10,
                                bottom: Dimension.height10/2,
                                right: Dimension.width20,
                                left: Dimension.width20
                            ),

                          ),
                          MyInputField(title: "TakeOff Location", hint: _selectedLocation,
                            widget: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,),
                              iconSize: 32,
                              elevation: 4,
                              underline: Container(height: 0,),
                              onChanged: (String? newValue){
                                setState(() {
                                  _selectedLocation = newValue!;
                                });
                              },
                              items:_locationList.map<DropdownMenuItem<String>>((String? value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!,style: TextStyle(color: Colors.grey),),
                                );
                              }).toList(),
                            ),),
                          SizedBox(height: Dimension.height15,),
                          MyInputField(title: "Destination", hint: _selectedDestination,
                            widget: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,),
                              iconSize: 32,
                              elevation: 4,
                              underline: Container(height: 0,),
                              onChanged: (String? newValue){
                                setState(() {
                                  _selectedDestination = newValue!;
                                });
                              },
                              items:_destinationList.map<DropdownMenuItem<String>>((String? value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!,style: TextStyle(color: Colors.grey),),
                                );
                              }).toList(),
                            ),),
                          SizedBox(height: Dimension.height15,),

                          SizedBox(height: Dimension.height15,),
                          MyInputField(title: "Flight Type", hint: _selectedFlightType,
                            widget: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,),
                              iconSize: 32,
                              elevation: 4,
                              underline: Container(height: 0,),
                              onChanged: (String? newValue){
                                setState(() {
                                  _selectedFlightType = newValue!;
                                });
                              },
                              items:_flightTypList.map<DropdownMenuItem<String>>((String? value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!,style: TextStyle(color: Colors.grey),),
                                );
                              }).toList(),
                            ),),
                          SizedBox(height: Dimension.height15,),

                          MyInputField(title: "Date", hint: df.format(_selectedDate),
                            widget: IconButton(
                              onPressed: (){
                                _getDateFromUser();
                              },
                              icon: Icon(Icons.calendar_today_outlined),
                              color: Color(0xff8F6ED5),),),
                          SizedBox(height: Dimension.height15,),

                          ElevatedButton(onPressed: (){
                            _validateInput(routeController);
                          },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff8F6ED5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                              child: Container(
                                  width: Dimension.width20*2+Dimension.width20,
                                  height: Dimension.height20+Dimension.height15,
                                  child: Center(
                                      child: Text("Continue",style: TextStyle(
                                          fontWeight: FontWeight.bold),))
                              )
                          ),
                          SizedBox(height: Dimension.height20,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScheduleListScreen()));
                            },
                            child: SmallTexts(text: "Check Here for Schedule List",
                              size: 18,color:Color(0xff8F6ED5) ,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ]),
      ):AppCustomLoader();
    });
  }

  _getDateFromUser()async{
    DateTime? _pickedDate = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if(_pickedDate !=null){
      setState(() {
        _selectedDate = _pickedDate;
      });
    }else{
      print("The date is null");
    }
  }

  _validateInput(FlightRouteListController flightRouteListController){
    if(_selectedLocation.isEmpty){
      Get.snackbar("Error", "Please Select your take off location",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      icon: Icon(Icons.warning_amber_rounded));
          return;
    }else if(_selectedDestination.isEmpty){
      Get.snackbar("Error", "Please Select your Destination",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      icon: Icon(Icons.warning_amber_rounded));
      return;
    }else if(_selectedFlightType.isEmpty) {
      Get.snackbar("Error", "Please Select your Flight Type",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }else if(_selectedLocation==_selectedDestination) {
      Get.snackbar(
          "Error", "Take Off Location and Destination cant't be the same",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }else if(_selectedDate == DateTime.now()) {
      Get.snackbar(
          "Error", "You cannot book today's flight today",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }else{
      flightRouteListController.getSearchedResult(context, _selectedLocation, _selectedDestination,df.format(_selectedDate));
    }
  }
}
