import 'package:flutter/material.dart';

class CustomerModel{
  int? id;
  String? name;
  String? address;
  String? gender;
  String? phoneNumber;
  String? email;
  int? age;
  String? password;
  String? dateOfBirth;
  String? stateOfOrigin;
  String? localGovernment;
  String? profileImage;
  int? approvedTrip;
  int? cancelledTrip;
  int? pendingTrip;

  CustomerModel({
      this.id,
      this.name,
      this.address,
      this.gender,
      this.phoneNumber,
      this.email,
      this.age,
      this.password,
      this.dateOfBirth,
      this.stateOfOrigin,
      this.localGovernment,
      this.profileImage,
      this.approvedTrip,
      this.cancelledTrip,
      this.pendingTrip});

  CustomerModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    age = json['age'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    stateOfOrigin = json['stateOfOrigin'];
    localGovernment = json['localGovernment'];
    profileImage = json['profileImage'];
    approvedTrip = json['approvedTrip'];
    cancelledTrip = json['cancelledTrip'];
    pendingTrip = json['pendingTrip'];
    gender = json['gender'];
  }
}