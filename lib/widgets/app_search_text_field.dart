
import 'package:flight_ticket_booking_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';

import '../utils/app_layout.dart';

class AppSearchTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final String textHint;
  final IconData icon;
  bool isObscure;
   AppSearchTextField({Key? key,required this.textEditingController,
    required this.textHint, required this.icon,this.isObscure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12)),
      //margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.radius30/2),
          boxShadow:
          [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child: TextField(
        obscureText: isObscure?true:false,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: textHint,
            hintStyle: (TextStyle(
                color: Styles.textColor
            )),
            prefixIcon: Icon(icon,color: Color(0xFFBFC2DF),),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimension.radius30/2),
                borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimension.radius30/2),
                borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white
                )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.radius30/2),

            )
        ),
      ),
    );
  }
}
