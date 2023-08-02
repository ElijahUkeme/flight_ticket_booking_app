class TokenModel{
  int? id;
  String? time;
  String? date;
  String? token;

  TokenModel({this.id, this.time, this.date, this.token});

  TokenModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    time = json["time"];
    date = json["date"];
    token = json["token"];
  }

  Map<String,dynamic>toJson(){
    return {
      "id":this.id,
      "time":this.time,
      "date":this.date,
      "token":this.token
    };
  }
}