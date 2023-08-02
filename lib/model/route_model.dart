class RouteModel{
  int? id;
  String? location;
  String? destination;
  String? takeOffTime;
  String? arrivalTime;
  String? takeOffAbbreviation;
  String? destinationAbbreviation;
  String? flightDuration;

  RouteModel({this.id, this.location, this.destination, this.takeOffTime,
      this.arrivalTime,this.takeOffAbbreviation,this.destinationAbbreviation,this.flightDuration});

  RouteModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    location = json['takeOffLocation'];
    destination = json['destination'];
    takeOffTime = json['takeOffTime'];
    arrivalTime = json['arrivalTime'];
    takeOffAbbreviation = json['takeOffAbbreviation'];
    destinationAbbreviation = json['destinationAbbreviation'];
    flightDuration = json['flightDuration'];
  }
}