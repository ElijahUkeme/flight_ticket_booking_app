import 'package:flutter/cupertino.dart';

class ProfileColumnWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  const ProfileColumnWidget({Key? key,
  required this.firstText,required this.secondText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          firstText,
          style: TextStyle(color: Color(0xff525F7F),
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(secondText,
          style: TextStyle(color: Color(0xff525F7F),
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),)
      ],
    );
  }
}
