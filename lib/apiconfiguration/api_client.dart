import 'dart:convert';

import 'package:flight_ticket_booking_app/constants/app_url_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(minutes: 5);
    token = AppUrlConstant.TOKEN;
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String url) async {
    try{
      Response response = await get(url);
      print("Calling post method in api client");
      return response;
    }catch(e){
      print("Error from the api client is "+e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> getDataWithParam(String url,String bToken) async {
    try{
      var queryUri = url+"?token=${bToken}";
      Response response = await get(queryUri);

      return response;
    }catch(e){
      print("Error from the api client is "+e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String url, dynamic body)async{
    try{
      Response response = await post(url, body,headers: _mainHeaders);
      print("Calling post method in api client");
      return response;
    }catch(e){
      print("Error from the api client is "+e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
  }