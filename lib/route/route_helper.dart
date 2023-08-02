


import 'package:flight_ticket_booking_app/auth/sign_in_screen.dart';
import 'package:flight_ticket_booking_app/auth/sign_up_screen.dart';
import 'package:flight_ticket_booking_app/screens/book_flight_sreen.dart';
import 'package:flight_ticket_booking_app/screens/flight_search_result_screen.dart';
import 'package:flight_ticket_booking_app/screens/schedule_list_screen.dart';
import 'package:flight_ticket_booking_app/screens/search_screen.dart';
import 'package:flight_ticket_booking_app/screens/tickets_screen.dart';
import 'package:flight_ticket_booking_app/screens/trip_token_page.dart';
import 'package:flight_ticket_booking_app/screens/user_token.dart';
import 'package:flight_ticket_booking_app/users/profile_screen.dart';
import 'package:flight_ticket_booking_app/users/sub_profile_screen.dart';
import 'package:flight_ticket_booking_app/users/user_details_screen.dart';
import 'package:get/get.dart';

import '../screens/admin_update_trip_page.dart';
import '../screens/bottom_bar.dart';

class RouteHelper{
 static const String initial = "/";
 static const String signUp = "/sign-up";
 static const String signIn = "/sign-in";
 static const String ticket = "/ticket";
 static const String profile = "/profile";
 static const String subProfile = "/sub-profile";
 static const String bookFlight = "/book-flight";
 static const String routeList = "/route-list";
 static const String userTokenPage = "/user-token";
 static const String searchPage = "/search-page";
 static const String routeSearch = "/route-search";
 static const String tripTokenPage = "/trip-token";
 static const String adminTripsPage = "/admin-trips-page";

 static String getInitial()=>'$initial';
 static String getSignUp()=>'$signUp';
 static String getSignIn()=>'$signIn';
 static String getTicketPage()=>'$ticket';
 static String getUserDetailsPage()=>'$profile';
 static String getSubProfile()=>'$subProfile';
 static String getBookFlightPage()=>'$bookFlight';
 static String getRouteListPage()=>'$routeList';
 static String getUserTokenPage()=>'$userTokenPage';
 static String getSearchPage()=>'$searchPage';
 static String getRouteSearchPage() =>'$routeSearch';
 static String getTripTokenPage() =>'$tripTokenPage';
 static String getAdminTripPage() => '$adminTripsPage';

 static List<GetPage> routes = [
   GetPage(name: initial, page: ()=>BottomBar()),
   GetPage(name: signUp, page: (){
     return SignUpScreen();
   },transition: Transition.fadeIn),
   GetPage(name: signIn, page: (){
     return  SignInScreen();
   },transition: Transition.fadeIn),
   GetPage(name: ticket, page: (){
     return TicketScreen();
   },transition: Transition.fade),
   GetPage(name: profile, page: (){
     return UserDetailsScreen();
   },transition: Transition.fadeIn),
   GetPage(name: subProfile, page: (){
     return SubProfileScreen();
   },transition: Transition.downToUp),
   GetPage(name: bookFlight, page: (){
     return BookFlightScreen();
   },transition: Transition.downToUp),
   GetPage(name: routeList, page: (){
     return ScheduleListScreen();
   },transition: Transition.fadeIn),
   GetPage(name: userTokenPage, page: (){
     return UserTokenPage();
   },transition: Transition.fadeIn),
   GetPage(name: searchPage, page: (){
     return SearchScreen();
   },transition: Transition.fadeIn),
   GetPage(name: routeSearch, page: (){
     return FlightSearchResultScreen();
   },transition: Transition.fadeIn),
   GetPage(name: tripTokenPage, page: (){
     return TripTokenPage();
   },transition: Transition.fadeIn),
   GetPage(name: adminTripsPage, page: (){
     return AdminUpdateTripPage();
   },transition: Transition.fadeIn),
 ];

}