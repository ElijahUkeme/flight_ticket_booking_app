import 'package:flutter/cupertino.dart';
import 'package:flight_ticket_booking_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppCustomLoader extends StatelessWidget {
  const AppCustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Center(
      child: Container(
        height: Dimension.height20*5,
        width: Dimension.height20*5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.height20*5/2),
            color: Colors.white
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.grey,),
      ),
    );
  }
}
