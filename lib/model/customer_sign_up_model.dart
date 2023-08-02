class CustomerSignUpModel{

  String? name;
  String? address;
  String? gender;
  String? phoneNumber;
  String? email;
  String? password;
  String? dateOfBirth;
  String? stateOfOrigin;
  String? localGovernment;
  String? profileImage;

  CustomerSignUpModel({
      this.name,
      this.address,
      this.gender,
      this.phoneNumber,
      this.email,
      this.password,
      this.dateOfBirth,
      this.stateOfOrigin,
      this.localGovernment,
      this.profileImage});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String,dynamic>();
    data["name"] = this.name;
    data["address"] = this.address;
    data["phoneNumber"] = this.phoneNumber;
    data["email"] = this.email;
    data["password"] = this.password;
    data["dateOfBirth"] = this.dateOfBirth;
    data["stateOfOrigin"] =this.stateOfOrigin;
    data["localGovernment"] =this.localGovernment;
    data["profileImage"] = this.profileImage;
    data["gender"] = this.gender;
    return data;
  }
}