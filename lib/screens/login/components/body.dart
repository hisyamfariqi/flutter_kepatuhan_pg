import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/rounded_button.dart';
import 'package:flutter_kepatuhan_pg/components/rounded_input_field.dart';
import 'package:flutter_kepatuhan_pg/components/rounded_password_field.dart';
import './background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo Petrokimia
            Positioned(
              top: size.height * 0.03,
              child: SvgPicture.asset(
                "assets/images/Petrokimia_Gresik_logo.svg",
                width: size.width * 0.5,
              ),
            ),
            SizedBox(height: size.height * 0.12),
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
            // Username InputField
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            // Password InputField
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            // Login Button
            RoundedButton(
              text: "Login",
              press: () {},
            ),
            SizedBox(height: size.height * 0.05)
          ],
        ),
      ),
    );
  }
}
