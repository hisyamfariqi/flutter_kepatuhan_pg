class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String email; //iki ngkok jadikno comment pas ngetes nak api mu
  // String username;
  String password;

  LoginRequestModel({
    this.email, //iki ngkok jadikno comment pas ngetes nak api mu
    // this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(), //iki ngkok jadikno comment pas ngetes nak api mu
      'password':
          password.trim(), //iki ngkok jadikno comment pas ngetes nak api mu

      // 'Username': username.trim(),
      // 'Password': password.trim(),
    };

    return map;
  }
}
