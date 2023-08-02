
import 'package:flight_ticket_booking_app/apiconfiguration/api_client.dart';
import 'package:flight_ticket_booking_app/constants/app_url_constants.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_in_model.dart';
import 'package:flight_ticket_booking_app/model/customer_sign_up_model.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomerRepository extends GetxService{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CustomerRepository({required this.apiClient,required this.sharedPreferences});
  
  //upload profile image
  Future<http.StreamedResponse> updateProfile(PickedFile? data)async{
    http.MultipartRequest request = http.MultipartRequest('POST',Uri.parse(
        AppUrlConstant.BASE_URL+AppUrlConstant.PROFILE_IMAGE_UPLOAD_URI));
    if(GetPlatform.isMobile && data !=null){
      File _file = File(data.path);
      request.files.add(http.MultipartFile('file', _file.readAsBytes().asStream(),_file.lengthSync(),filename: _file.path));
    }
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<Response> registerCustomer(CustomerSignUpModel customerSignUpModel)async{
    return await apiClient.postData(AppUrlConstant.CUSTOMER_REGISTRATION_URI, customerSignUpModel.toJson());
  }

  bool isCustomerLoggedIn(){
    return sharedPreferences.containsKey(AppUrlConstant.EMAIL);
  }
  Future<Response> loginCustomer(CustomerSignInModel customerSignInModel)async{
    return await apiClient.postData(AppUrlConstant.CUSTOMER_LOGIN_URI, customerSignInModel.toJson());
  }

  Future<void> saveCustomerEMail(String email) async {
    try{
      await sharedPreferences.setString(AppUrlConstant.EMAIL, email);
      print("The saved email address in the sharedpreference is "+sharedPreferences.getString(AppUrlConstant.EMAIL)!);
    }catch(e){
      print("Error in saving customer info is "+e.toString());
    }
  }

  bool clearSharedData(){
    sharedPreferences.remove(AppUrlConstant.EMAIL);
    sharedPreferences.remove(AppUrlConstant.PASSWORD);
    return true;
  }
  String retrieveUserEmail(){
    return sharedPreferences.getString(AppUrlConstant.EMAIL).toString();
  }
}