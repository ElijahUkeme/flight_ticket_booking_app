

import 'package:flight_ticket_booking_app/model/route_model.dart';

import 'customer_model.dart';

class TripInfo{
  String? boardingType;
  String? takeOffLocation;
  String? destination;
  String? status;
  double? price;
  String? tripDate;
  String? takeOffDate;
  String? arrivalDate;
  int? seatNumber;
  String? pilotName;
  String? airplaneNumber;
  RouteModel? routeModel;
  CustomerModel? customerModel;

  TripInfo({
    this.boardingType,
    this.takeOffLocation,
    this.destination,
    this.status,
    this.price,
    this.tripDate,
    this.takeOffDate,
    this.arrivalDate,
    this.seatNumber,
    this.pilotName,
    this.airplaneNumber,
     this.routeModel,
     this.customerModel});

  TripInfo.fromJson(Map<String, dynamic> json){
    boardingType = json['boardingType'];
    takeOffLocation = json['takeOffLocation'];
    destination = json['destination'];
    status = json['status'];
    price = json['price'];
    tripDate = json['travelDate'];
    takeOffDate = json['takeOffDate'];
    arrivalDate = json['arrivalDate'];
    seatNumber = json['seatNumber'];
    pilotName = json["pilotName"];
    airplaneNumber = json["airplaneNumber"];
    routeModel = RouteModel.fromJson(json["routeModel"]);
    customerModel = CustomerModel.fromJson(json["customer"]);
  }
}