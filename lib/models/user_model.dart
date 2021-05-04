import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String username;
  String password;

  User({
    this.id,
    this.username,
    this.password,
  });

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      username: object['username'],
      password: object['password'],
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "http://localhost:3000/getdata";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)[''];

    return User.createUser(userData);
  }
}
