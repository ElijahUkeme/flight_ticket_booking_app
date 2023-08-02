import 'package:flight_ticket_booking_app/auth/sign_in_screen.dart';
import 'package:flight_ticket_booking_app/controller/trip_controller.dart';
import 'package:flight_ticket_booking_app/screens/book_flight_sreen.dart';
import 'package:flight_ticket_booking_app/screens/flight_search_result_screen.dart';
import 'package:flight_ticket_booking_app/screens/home_screen.dart';
import 'package:flight_ticket_booking_app/screens/schedule_list_screen.dart';
import 'package:flight_ticket_booking_app/screens/trip_token_page.dart';
import 'package:flight_ticket_booking_app/users/profile_screen.dart';
import 'package:flight_ticket_booking_app/screens/search_screen.dart';
import 'package:flight_ticket_booking_app/users/sub_profile_screen.dart';
import 'package:flight_ticket_booking_app/screens/tickets_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hotel_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const ScheduleListScreen(),
    const SearchScreen(),
    const SignInScreen(),
    const TripTokenPage()
  ];
  void _onItemTapped(int index){
   setState(() {
     _selectedIndex= index;
   });
    //print("The selected index is ${_selectedIndex}");
  }
  @override
  Widget build(BuildContext context) {
    Get.find<TripController>();
    return Scaffold(
      body: Center(
        child:
        _widgetOptions[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey,
          items: const [

        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home"),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
            label: "Search"),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_airplane_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_airplane_filled),
            label: "Ticket"),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile")
      ]),
    );
  }
}
