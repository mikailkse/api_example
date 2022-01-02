class RegisterRequestModel {
  String? fullName;
  String? email;
  String? password;
  String? country;

  RegisterRequestModel(
      {this.fullName, this.email, this.password, this.country});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['country'] = country;
    return data;
  }
}
