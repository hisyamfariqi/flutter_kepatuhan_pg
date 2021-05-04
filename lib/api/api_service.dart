import 'package:flutter_kepatuhan_pg/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://reqres.in/api/login";
    // String url = "http://localhost:3000/getdata";

    final response = await http.post(url, body: requestModel.toJson());
    print(requestModel.email);
    print(requestModel.password);
    print(requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
