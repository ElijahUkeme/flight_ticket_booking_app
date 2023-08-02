class BookTripModel{
  int? routeId;
  String? customerEmail;
  String? travelDate;

  BookTripModel({this.routeId, this.customerEmail, this.travelDate});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['routeId'] = this.routeId;
    data['customerEmail'] = this.customerEmail;
    data['travelDate'] = this.travelDate;
    return data;
  }
}