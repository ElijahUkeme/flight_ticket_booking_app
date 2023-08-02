import 'dart:convert';

import 'package:flight_ticket_booking_app/model/customer_model.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_in_model.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_up_model.dart';
import 'package:flight_ticket_booking_app/response/registration_response_model.dart';
import 'package:flight_ticket_booking_app/repository/customer_repository.dart';
import 'package:flight_ticket_booking_app/widgets/show_custom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../route/route_helper.dart';

class CustomerController extends GetxController{
  final CustomerRepository customerRepository;

  String? _imagePath;
  String? get imagePath => _imagePath;
  PickedFile? _imageFile;
  bool? _isSuccessful=false;
  bool? get isSuccessful => _isSuccessful;
  PickedFile? get pickedFile => _imageFile;
  final  _imagePicker = ImagePicker();

  CustomerController({required this.customerRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late CustomerModel _customerModel;
  CustomerModel get customerModel => _customerModel;

  //for picking an image from either gallery or Camera
  Future<void> takePhoto(ImageSource source)async{
    _imageFile = await _imagePicker.getImage(
        source: source);
    update();
  }

  //method to upload image to the server
  Future <RegistrationResponseModel> uploadProfileImage()async{
    update();
    _isLoading = true;
    http.StreamedResponse response = await customerRepository.updateProfile(_imageFile);
    late RegistrationResponseModel registrationResponseModel;

    if(response.statusCode==201){
      Map map = jsonDecode(await response.stream.bytesToString());
      String imageUrl = map["downloadUrl"];
      registrationResponseModel = RegistrationResponseModel(true, imageUrl);
      _imagePath = imageUrl;
      print(registrationResponseModel.message);


    }else{
      registrationResponseModel = RegistrationResponseModel(false, response.toString());
      print("Error uploading image to the server");
    }
    _isLoading = false;
    update();
    print("The image path in the getter is "+imagePath.toString());
    return registrationResponseModel;

  }

    //for user's registration
  Future<RegistrationResponseModel> registerCustomer(BuildContext context, CustomerSignUpModel customerSignUpModel) async {
    _isLoading = true;
    update();
    Response response = await customerRepository.registerCustomer(customerSignUpModel);
    late RegistrationResponseModel registrationResponseModel;
    if(response.statusCode==201){
      registrationResponseModel = RegistrationResponseModel(response.body["success"],response.body["message"]);
      _isSuccessful = registrationResponseModel.isSuccess;
      print("Registration successful");
      print(response.body["message"]);
      alertDialog(context, response.body["message"]);

    }else{
      registrationResponseModel = RegistrationResponseModel(false, response.statusText!);
      print("Registration not successful");
      print(response.statusCode.toString());
      print(response.body["message"]);
      _isSuccessful = registrationResponseModel.isSuccess;
      showCustomSnackBar(response.body["message"],title: "Error");
    }
    _isLoading = false;
    update();
    return registrationResponseModel;
  }
  Future<RegistrationResponseModel> loginCustomer(CustomerSignInModel customerSignInModel) async {
    _isLoading = true;
    update();
    Response response = await customerRepository.loginCustomer(customerSignInModel);
    late RegistrationResponseModel registrationResponseModel;
    if(response.statusCode==200){
      _customerModel = CustomerModel.fromJson(response.body);
      print("The logged in customer is "+_customerModel.toString());
      print("The email address from the logged in user is "+_customerModel.email.toString());
      registrationResponseModel = RegistrationResponseModel(true, "Customer Login Successfully");
      saveEmail(_customerModel.email!);
    }else{
      registrationResponseModel = RegistrationResponseModel(false, response.statusText!);
      print("The error message from the customer controller is: "+response.statusText!);
      print("The status code from the customer controller is: "+response.statusCode.toString());
      showCustomSnackBar(response.body["message"],title: "Error");
    }
    _isLoading = false;
    update();
    return registrationResponseModel;
  }
  void saveEmail(String email){
    customerRepository.saveCustomerEMail(email);
  }
  bool isUserLoggedIn(){
    return customerRepository.isCustomerLoggedIn();
  }
  bool clearSharedData(){
    return customerRepository.clearSharedData();
  }
  String retrieveLoggedInUserEmail(){
    return customerRepository.retrieveUserEmail();
  }

  Future<bool> alertDialog(BuildContext context, String message)async{
    return await showDialog(
        context:context , builder: (BuildContext context){
      return AlertDialog(
        title: Text("Success"),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: (){
              Get.toNamed(RouteHelper.initial);
            },
            child: Text("Ok"),
          )
        ],
      );
    });
  }
}