import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key,required this.title,
    required this.hint,this.controller,
    this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            color: Color(0xff8F6ED5)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(left: 14),
            height: 52,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white,
                    width: 1.0
                ),
                borderRadius: BorderRadius.circular(Dimension.radius30),
                boxShadow:
                [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                      color: Colors.white
                  )
                ]
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                        readOnly: widget==null?false:true,
                        autofocus: false,
                        cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                        controller: controller,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8F6ED5)),
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: (TextStyle(
                              color: Color(0xff8F6ED5)
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            ),
                          ),
                        )
                    )),
                widget==null?Container():Container(child: widget,)],
            ),
          )
        ],
      ),
    );
  }
}
