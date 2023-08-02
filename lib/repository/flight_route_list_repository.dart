
import 'package:flight_ticket_booking_app/apiconfiguration/api_client.dart';
import 'package:flight_ticket_booking_app/constants/app_url_constants.dart';
import 'package:get/get.dart';

class FlightRouteListRepository extends GetxService{

  final ApiClient apiClient;
  FlightRouteListRepository({required this.apiClient});

  Future<Response> getAllRouteList() async {
    return await apiClient.getData(AppUrlConstant.ROUTE_LIST_URI);
  }
  Future<Response> searchRoute(String takeOffLocation,String destination)async{
    return await apiClient.postData(AppUrlConstant.SEARCH_ROUTE_URI, {"takeOffLocation":takeOffLocation,"destination":destination});
  }

}