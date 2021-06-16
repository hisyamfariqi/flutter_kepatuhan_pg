import 'package:flutter_kepatuhan_pg/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url =
     //   "https://reqres.in/api/login"; //iki ngkok jadikno comment pas ngetes nak api mu
    //String url = "http://localhost:3000/getuser";
    "http://10.0.2.2:3000/getuser";

    final response = await http.post(url, body: requestModel.toJson());
    //print(requestModel.email); //iki ngkok jadikno comment pas ngetes nak api mu
    print(requestModel.username);
    print(requestModel.password);
    print(requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      return LoginResponseModel.fromJson(
          json.decode(response.body).toList()
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
