
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get.dart';

import 'big_texts.dart';

void showCustomSnackBar(String message,{bool isError=true, String title ="Error"}){
  Get.snackbar(title, message,
      titleText: BigTexts(text: title,color: Colors.white,)
      ,messageText: Text(message,style: const TextStyle(
          color: Colors.white
      ),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color(0xff8F6ED5));
}