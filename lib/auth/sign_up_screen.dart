import 'dart:io';

import 'package:flight_ticket_booking_app/auth/sign_in_screen.dart';
import 'package:flight_ticket_booking_app/constants/app_url_constants.dart';
import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_in_model.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_up_model.dart';
import 'package:flight_ticket_booking_app/users/sub_profile_screen.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flight_ticket_booking_app/widgets/app_small_texts.dart';
import 'package:flight_ticket_booking_app/widgets/my_input_field.dart';
import 'package:flight_ticket_booking_app/widgets/show_custom_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../widgets/app_colors_widget.dart';
import '../widgets/app_icon_text_widget.dart';
import '../widgets/app_text_field.dart';
import '../widgets/clipper_widget.dart';
import '../widgets/profile_column_widget.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime _selectedDate = DateTime.now();
  DateFormat df = DateFormat("yyyy-MM-dd");
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var genderController = TextEditingController();
  var stateOfOriginController = TextEditingController();
  var localGovernmentController = TextEditingController();
  String _selectedGender = "";

  List<String> _gender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (_customerController) {
        return !_customerController.isLoading
            ? Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.white,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: gradientColor,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ),
                    ),
                    Positioned(
                      top: Dimension.height40 * 3 + Dimension.height30,
                      right: Dimension.width30,
                      left: Dimension.width30,
                      bottom: Dimension.height30,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(top: Dimension.height40),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimension.height20,
                                      bottom: Dimension.height10 / 2,
                                      right: Dimension.width20,
                                      left: Dimension.width20),
                                  child: Divider(
                                    thickness: 0.05,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                AppTextField(
                                    textEditingController: nameController,
                                    textHint: "Name",
                                    icon: Icons.person),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                AppTextField(
                                    textEditingController: emailController,
                                    textHint: "Email",
                                    icon: Icons.email),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                AppTextField(
                                  textEditingController: passwordController,
                                  textHint: "Password",
                                  icon: Icons.password,
                                  isObscure: true,
                                ),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                AppTextField(
                                    textEditingController: phoneController,
                                    textHint: "Phone Number",
                                    icon: Icons.phone),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                AppTextField(
                                    textEditingController: addressController,
                                    textHint: "Address",
                                    icon: Icons.location_on),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                AppTextField(
                                    textEditingController:
                                        localGovernmentController,
                                    textHint: "Local Government",
                                    icon: Icons.location_city),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                AppTextField(
                                    textEditingController:
                                        stateOfOriginController,
                                    textHint: "State",
                                    icon: Icons.location_city),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                MyInputField(
                                  title: "Gender",
                                  hint: _selectedGender,
                                  widget: DropdownButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    ),
                                    iconSize: 32,
                                    elevation: 4,
                                    underline: Container(
                                      height: 0,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedGender = newValue!;
                                      });
                                    },
                                    items: _gender
                                        .map<DropdownMenuItem<String>>(
                                            (String? value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value!,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimension.height15,
                                ),
                                MyInputField(
                                  title: "Date of Birth",
                                  hint: df.format(_selectedDate),
                                  widget: IconButton(
                                    onPressed: () {
                                      _getDateFromUser();
                                    },
                                    icon: Icon(Icons.calendar_today_outlined),
                                    color: Color(0xff8F6ED5),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimension.height30 / 2,
                                ),
                                MyInputField(
                                  title: "Pick Profile Image",
                                  hint: "",
                                  widget: IconButton(
                                    onPressed: () {
                                      _showButtonSheet();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                    ),
                                    color: Color(0xff8F6ED5),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimension.height10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _validateInput(_customerController);
                                      //Get.find<CustomerController>().uploadImage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff8F6ED5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    child: Container(
                                        width: Dimension.width20 * 2 +
                                            Dimension.width15,
                                        height: Dimension.height20 +
                                            Dimension.height15,
                                        child: Center(
                                            child: Text(
                                          "Register",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )))),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen()));
                                  },
                                  child: SmallTexts(
                                    text: "Already Registered? Sign In",
                                    size: 18,
                                    color: Color(0xff8F6ED5),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimension.height30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: Dimension.height40 + Dimension.height30,
                        left: MediaQuery.of(context).size.width / 2 - 75,
                        child: GetBuilder<CustomerController>(
                          builder: (_imageController) {
                            return Container(
                              child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: _imageController
                                              .pickedFile ==
                                          null
                                      ? AssetImage("assets/images/profile.png")
                                      : FileImage(File(_imageController
                                          .pickedFile!.path)) as ImageProvider),
                            );
                          },
                        )),
                  ],
                ),
              )
            : AppCustomLoader();
      },
    );
  }

  Widget _bottomSheetProfile() {
    return GetBuilder<CustomerController>(
      builder: (_customerController) {
        return Container(
          height: Dimension.height20 * 8,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                "Choose A Profile Photo",
                style: TextStyle(fontSize: 20, color: Color(0xff8F6ED5)),
              ),
              SizedBox(
                height: Dimension.height20 / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        _customerController.takePhoto(ImageSource.camera);
                      },
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: Color(0xff8F6ED5),
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        _customerController.takePhoto(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.image,
                        color: Color(0xff8F6ED5),
                        size: 30,
                      ))
                ],
              ),
              SizedBox(
                height: Dimension.height20 / 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Camera",
                    style: TextStyle(fontSize: 18, color: Color(0xff8F6ED5)),
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(fontSize: 18, color: Color(0xff8F6ED5)),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  _showButtonSheet() {
    showModalBottomSheet(
        context: context, builder: ((builder) => _bottomSheetProfile()));
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;

        print("the selected date of birth is $_selectedDate");
      });
    } else {
      print("The date is null");
    }
  }

  _validateInput(CustomerController customerController){
    if (nameController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your Name",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your Email",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (!emailController.text.isEmail) {
      Get.snackbar("Error", "Please Enter A Valid Email Address",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your Password",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your Phone Number",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (addressController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your Address",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (localGovernmentController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your L.G.Area",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (stateOfOriginController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter your State of Origin",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    }
    if (_selectedDate == DateTime.now()) {
      Get.snackbar("Error", "Please Select your Date of Birth",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
      return;
    } else {
      CustomerSignUpModel customerSignUpModel;
      customerController.uploadProfileImage().then((status) async =>
      {
        if(status.isSuccess){
          print("The sent image path is " + customerController.imagePath!),
          if(customerController.imagePath !=null){
            customerSignUpModel = CustomerSignUpModel(
                name: nameController.text,address: addressController.text,gender: _selectedGender,
                phoneNumber: phoneController.text,email: emailController.text,password: passwordController.text,
                dateOfBirth: df.format(_selectedDate),stateOfOrigin: stateOfOriginController.text,
                localGovernment: localGovernmentController.text,profileImage: customerController.imagePath
            ),
            print("The selected gender is "+_selectedGender),
            await customerController.registerCustomer(context, customerSignUpModel)

          }else{
            print("Image path sent was null")
          }
      }else{
    print("Image Upload Was not Successful")
    }
      });

    }
  }

}


