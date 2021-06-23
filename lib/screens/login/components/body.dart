import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/progress_hud.dart';
import 'package:flutter_kepatuhan_pg/constants.dart';
import 'package:flutter_kepatuhan_pg/models/login_model.dart';
import 'package:flutter_kepatuhan_pg/api/api_service.dart';
import 'package:flutter_kepatuhan_pg/components/rounded_button.dart';
import 'package:flutter_kepatuhan_pg/screens/home/home_screen.dart';
import './background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  LoginRequestModel loginRequestModel;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final backgroundKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      key: backgroundKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            // Logo Petrokimia
            Positioned(
              top: size.height * 0.03,
              child: SvgPicture.asset(
                "assets/images/Petrokimia_Gresik_logo.svg",
                width: size.width * 0.6,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            // Big Text Login Title
            Text(
              "Login - Pernyataan Kepatuhan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: size.height * 0.02),
            // Login Help Text
            Padding(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Text(
                "Silahkan masukkan username (NIK) dan kata sandi Anda sesuai dengan yang digunakan dalam website Knowledge Management. Contoh username 'T222054' atau 't222054':",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Form(
              key: globalFormKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) {
                        loginRequestModel.username = input;
                        print(loginRequestModel.username);
                      },
                      validator: (input) => input.length < 1
                          ? "Username should not be empty"
                          : null,
                      decoration: InputDecoration(
                        hintText: "Username",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: primaryColor.withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  // Password InputField
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) {
                        loginRequestModel.password = input;
                        print(loginRequestModel.password);
                      },
                      validator: (input) => input.length < 1
                          ? "Password should not be empty"
                          : null,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: primaryColor.withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: primaryColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: primaryColor.withOpacity(0.4),
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                  ),

                  // Login Button
                  RoundedButton(
                    text: "Login",
                    press: () {
                      if (validateAndSave()) {
                        print(loginRequestModel.toJson());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));

                        // setState(() {
                        //   isApiCallProcess = true;
                        // });

                        // APIService apiService = APIService();
                        // apiService.login(loginRequestModel).then((value) {
                        //   setState(() {
                        //     isApiCallProcess = false;
                        //   });

                        //   if (value.token.isNotEmpty) {
                        //     final snackBar =
                        //         SnackBar(content: Text("Login Success"));
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBar);
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return HomeScreen();
                        //         },
                        //       ),
                        //     );
                        //   } else {
                        //     print("Error iki");
                        //     print(value.error);
                        //     final snackBar =
                        //         SnackBar(content: Text(value.error));
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBar);
                        //         Navigator.push(context, MaterialPageRoute(builder: (context){
                        //           return HomeScreen();
                        //         }));
                        //   }
                        // });
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.05)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
