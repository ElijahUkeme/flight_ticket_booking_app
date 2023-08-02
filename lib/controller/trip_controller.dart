import 'dart:convert';

import 'package:flight_ticket_booking_app/model/book_trip_model.dart';
import 'package:flight_ticket_booking_app/model/customer_model.dart';
import 'package:flight_ticket_booking_app/model/route_model.dart';
import 'package:flight_ticket_booking_app/model/token_model.dart';
import 'package:flight_ticket_booking_app/model/trip_model_info.dart';
import 'package:flight_ticket_booking_app/repository/trip_repository.dart';
import 'package:flight_ticket_booking_app/response/booking_response.dart';
import 'package:flight_ticket_booking_app/route/route_helper.dart';
import 'package:flight_ticket_booking_app/widgets/show_custom_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TripController extends GetxController{
  final TripRepository tripRepository;
  TripController({required this.tripRepository});

  DateTime bookedDate = DateTime.now();
  DateTime bookedTime = DateTime.now();
  DateFormat df = DateFormat("yyyy-MM-dd");
  DateFormat tf = DateFormat("HH:mm");

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _token = "";
  String get token => _token;
  Map<int, TokenModel> _items = {};
  Map<int, TokenModel> get items =>_items;
  List<TokenModel> storageItems = [];
  late TripInfo _getTripInfo;
  TripInfo get getTripInfo => _getTripInfo;

  Future<BookingResponse> bookATrip(BuildContext context, BookTripModel bookTripModel)async{
    _isLoading = true;
    update();
    Response response = await tripRepository.bookATrip(bookTripModel);
    late BookingResponse bookingResponse;
    try{
      if(response.statusCode==201){
        //store the token into sharedpreferences for future use
        //tripRepository.saveTripToken(response.body["token"]);
        bookingResponse = BookingResponse(response.body["message"],response.body["token"]);
        _token = bookingResponse.token;
        addToken(token, storageItems.length+1);
        print(bookingResponse.message);
        print(bookingResponse.token);
        //print(getTokens);
        alertDialog(context, token);

      }else{
        showCustomSnackBar(response.body["message"],title: "Error");
        print("The status code is "+response.statusCode.toString());
        print("The error in the response is "+response.body["message"]);
        bookingResponse = BookingResponse(response.body["message"], "No Token");
      }

    }catch(e){
      print("The error message is: "+e.toString());
    }
    _isLoading = false;
    update();

    return bookingResponse;

  }
  Future<void> getTripInformation(String tripToken)async{

    _isLoading = true;
    update();
    Response response = await tripRepository.getTripInfo(tripToken);

    if(response.statusCode==200){
      _isLoading = false;
      _getTripInfo = TripInfo.fromJson(response.body);
      Get.toNamed(RouteHelper.getTicketPage());
    }else{
      showCustomSnackBar(response.body["message"],title: "Error");
      print("The error from the server is: "+response.body["message"]);
      print("The response code is: "+response.statusCode.toString());

      _isLoading =false;
      update();
    }
    print("The status code is "+response.statusCode.toString());
    print("The status message is: "+response.statusText!);
    _isLoading = false;
    update();
  }
  void addToken(String tripToken,int itemId){
    _items.putIfAbsent(itemId, () {
      return TokenModel(
        id: itemId,
        time: tf.format(bookedTime),
        date: df.format(bookedDate),
        token: tripToken
      );
    });
    tripRepository.addToTokenList(getTokens);
    update();
    print("The token length is "+getTokens.length.toString());
    print("The tokens are "+getTokens.toString());

  }
  List<TokenModel> get getTokens{
    return _items.entries.map((e) {
      return e.value;
  }).toList();
}

List<TokenModel> getTripTokens(){
    setTokens = tripRepository.getTokens();
    return storageItems;

}
set setTokens(List<TokenModel> items){
    storageItems = items;
    print("The length of the item is "+storageItems.length.toString());
    for(int i=0;i<storageItems.length;i++){
      _items.putIfAbsent(storageItems[i].id!, () => storageItems[i]);
    }
}
  Future<bool> alertDialog(BuildContext context, String bookingToken)async{
    return await showDialog(
        context:context , builder: (BuildContext context){
          return AlertDialog(
            title: Text("Booking Successful"),
            content: Text("Token: "+bookingToken),
            actions: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Get.toNamed(RouteHelper.subProfile);
                  update();
                },
                child: Text("Ok"),
              )
            ],
          );
    });
  }
}