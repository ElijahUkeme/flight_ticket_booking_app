import 'package:flight_ticket_booking_app/auth/sign_up_screen.dart';
import 'package:flight_ticket_booking_app/controller/customer_controller.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_in_model.dart';
import 'package:flight_ticket_booking_app/route/route_helper.dart';
import 'package:flight_ticket_booking_app/screens/book_flight_sreen.dart';
import 'package:flight_ticket_booking_app/users/sub_profile_screen.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flight_ticket_booking_app/widgets/app_custom_loader.dart';
import 'package:flight_ticket_booking_app/widgets/app_search_text_field.dart';
import 'package:flight_ticket_booking_app/widgets/big_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_colors_widget.dart';
import '../widgets/app_small_texts.dart';
import '../widgets/app_text_field.dart';
import '../widgets/clipper_widget.dart';
import 'package:get/get.dart';

import '../widgets/show_custom_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    _validateLoginDetails(CustomerController customerController) {
      String email = emailController.text;
      String password = passwordController.text;

      if (email.isEmpty) {
        showCustomSnackBar("Please Enter your Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Not a Valid Email Format");
      } else if (password.isEmpty) {
        showCustomSnackBar("Please Enter your Password");
      } else {
        CustomerSignInModel customerSignInModel = CustomerSignInModel(email: email,password: password);
        customerController.loginCustomer(customerSignInModel).then((status){
          if(status.isSuccess){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubProfileScreen()));
          }else{
            print("The success message from the sign in page is "+status.isSuccess.toString());
          }
        });

      }
    }

    return GetBuilder<CustomerController>(builder:(customerController){
      return !customerController.isLoading? Container(
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
                bottom: Dimension.height40*2,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimension.radius20/2)),
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: Dimension.height40,bottom: Dimension.height15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BigTexts(text: "Login",size: 35,color: Color(0xff8F6ED5),)
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimension.height10,
                                bottom: Dimension.height10/2,
                                right: Dimension.width20,
                                left: Dimension.width20
                            ),

                          ),
                          AppTextField(
                              textEditingController: emailController,
                              textHint: "Email",
                              icon: Icons.email),
                          SizedBox(height: Dimension.height15,),
                          AppTextField(
                            textEditingController: passwordController,
                            textHint: "Password",
                            icon: Icons.password,isObscure: true,),
                          SizedBox(height: Dimension.height15,),


                          ElevatedButton(onPressed: (){
                            _validateLoginDetails(customerController);
                          },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff8F6ED5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                              child: Container(
                                  width: Dimension.width20*2+Dimension.width15,
                                  height: Dimension.height20+Dimension.height15,
                                  child: Center(
                                      child: Text("Login",style: TextStyle(
                                          fontWeight: FontWeight.bold),))
                              )
                          ),
                          SizedBox(height: Dimension.height20,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                            },
                            child: SmallTexts(text: "Not Registered? Sign Up",
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

}
