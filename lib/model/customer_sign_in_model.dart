class CustomerSignInModel{
  String? email;
  String? password;

  CustomerSignInModel({this.email, this.password});

  Map<String, dynamic> toJson(){
    return {
      "email":this.email,
      "password":this.password
    };
  }
}