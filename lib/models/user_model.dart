import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  // String id;
  String username;
  String password;

  User({
    // this.id,
    this.username,
    this.password,
  });

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      // id: object['id'].toString(),
      username: object['Username'],
      password: object['Password'],
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "http://10.0.2.2:3000/getuser";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)[''];

    return User.createUser(userData);
  }
}
