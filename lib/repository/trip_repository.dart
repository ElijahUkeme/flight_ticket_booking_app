import 'dart:convert';

import 'package:flight_ticket_booking_app/apiconfiguration/api_client.dart';
import 'package:flight_ticket_booking_app/constants/app_url_constants.dart';
import 'package:flight_ticket_booking_app/model/book_trip_model.dart';
import 'package:flight_ticket_booking_app/model/token_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TripRepository extends GetxService{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  TripRepository({required this.apiClient,required this.sharedPreferences});

  List<String> tokenList = [];

  void addToTokenList(List<TokenModel> list){
    tokenList = [];
    list.forEach((element) {
      return tokenList.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppUrlConstant.TOKEN_LIST, tokenList);
  }
  List<TokenModel> getTokens(){
    List<String> tokens = [];
    if(sharedPreferences.containsKey(AppUrlConstant.TOKEN_LIST)){
      tokens = sharedPreferences.getStringList(AppUrlConstant.TOKEN_LIST)!;
      print(tokens.toString());
    }
    List<TokenModel> tokenListRetrieved = [];
    tokens.forEach((element) {
      return tokenListRetrieved.add(TokenModel.fromJson(jsonDecode(element)));
    });
    return tokenListRetrieved;
  }
  void clearTokenList(){
    tokenList = [];
    sharedPreferences.remove(AppUrlConstant.TOKEN_LIST);
  }

  Future<Response> bookATrip(BookTripModel bookTripModel)async{
    return await apiClient.postData(AppUrlConstant.BOOK_A_TRIP_URI, bookTripModel.toJson());
  }

  Future<bool> saveTripToken(String token)async{
    return await sharedPreferences.setString(AppUrlConstant.TOKEN, token);
  }

  Future<Response> getTripInfo(String bookingToken)async{
    return await apiClient.getDataWithParam(AppUrlConstant.TRIP_INFO_URI, bookingToken);
  }
}