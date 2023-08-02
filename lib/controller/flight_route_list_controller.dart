import 'dart:convert';

import 'package:flight_ticket_booking_app/model/route_model.dart';
import 'package:flight_ticket_booking_app/repository/flight_route_list_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route_helper.dart';

class FlightRouteListController extends GetxController{
  final FlightRouteListRepository flightRouteListRepository;
  FlightRouteListController({required this.flightRouteListRepository});

  List<RouteModel> _routeModelList = [];
  List<RouteModel> get routeModelList => _routeModelList;

  List<RouteModel> _searchList = [];
  List<RouteModel> get searchList => _searchList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAllFlightRoute()async{

    Response response = await flightRouteListRepository.getAllRouteList();
    try{
          _isLoaded = true;
          update();
          if(response.statusCode==200){
            print("The response code is: "+response.statusCode.toString());
            print("Got route from the server");
            final responseItem =response.body as List<dynamic>;
            _routeModelList = [];
            for (final item in responseItem){
              _routeModelList.add(RouteModel.fromJson(item));

            }

          }else{
            print("The response code is: "+response.statusCode.toString());
            print("The error is: "+response.statusText!);
          }
    }catch(e){
      print("The error from the server is: "+e.toString());
    }
    _isLoaded =false;
    update();
  }

  Future<void> getSearchedResult(BuildContext context, String takeOffLocation,String destination,String travelDate)async{
    Response response = await flightRouteListRepository.searchRoute(takeOffLocation, destination);
    try{
      _isLoaded = true;
      update();
      if(response.statusCode==200){
        final searchResponse = response.body as List<dynamic>;
        print("Route search found");

        _searchList = [];
        for(final item in searchResponse){
          _searchList.add(RouteModel.fromJson(item));
          print(item.toString());
        }

        if(searchList.length ==0){
          _isLoaded = false;
          update();
          alertDialog(context);
        }else{
          Get.toNamed(RouteHelper.getRouteSearchPage(),arguments: {
            "travelDate":travelDate
          });
        }
      }else{
        print("Error from the server "+response.statusText!);
      }

    }catch(e){
      print("Error message "+e.toString());
    }
    _isLoaded = false;
    update();
    print("The response code is "+response.statusCode.toString());
  }
  Future<bool> alertDialog(BuildContext context)async{
    return await showDialog(
        context:context , builder: (BuildContext context){
      return AlertDialog(
        title: Text("Error"),
        content: Text("Search Result Not Found"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: (){
              Get.back();
            },
            child: Text("Ok"),
          )
        ],
      );
    });
  }
}