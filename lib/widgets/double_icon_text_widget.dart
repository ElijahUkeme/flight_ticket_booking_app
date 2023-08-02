import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class DoubleIconTextWidget extends StatelessWidget {

  final IconData firstIcon;
  final String firstText;
  final IconData secondIcon;
  final String secondText;
  const DoubleIconTextWidget({Key? key,
    required this.firstIcon, required this.firstText,
    required this.secondIcon, required this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width/4;
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12),
          horizontal: AppLayout.getWidth(12)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(

        children: [
          Icon(firstIcon, color: const Color(0xFFBFC2DF),),
          Gap(AppLayout.getWidth(10)),
          Text(firstText, style: Styles.textStyle,),
          Gap(AppLayout.getHeight(width)),
          Icon(secondIcon, color: const Color(0xFFBFC2DF),),
          Gap(AppLayout.getWidth(10)),
          Text(secondText, style: Styles.textStyle,)
        ],
      ),
    );
  }
}
