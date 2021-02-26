import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/contact_box.dart';
import 'package:flutter_kepatuhan_pg/constants.dart';
import './background.dart';

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
            Image.asset(
              "assets/images/Petrokimia_Gresik_logo_long.png",
              width: size.width * 0.7,
            ),
            // SizedBox(height: size.height * 0.02),
            // // Big Text Page Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    "SELAMAT DATANG DI PEKA PG",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: primaryColor),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                // // Login Help Text
                Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Text(
                    "PEKA PG (Pernyataan Kepatuhan Online PT Petrokimia Gresik) adalah sistem aplikasi penandatanganan Pernyataan Kepatuhan bagi Insan Petrokimia Gresik yang dilakukan secara online.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Text(
                      "Pernyataan Kepatuhan adalah komitmen dari Insan Petrokimia Gresik terhadap penerapan PEBK (Pedoman Etika Bisnis dan Etika Kerja) PT Petrokimia Gresik. PEBK merupakan salah satu perangkat dari GCG (Good Corporate Governance). Guna mendukung penerapan GCG/Tata Kelola Perusahaan yang Baik, mohon bantuan/kesediaan Bapak/Ibu/Saudara untuk menandatangani Pernyataan Kepatuhan PG."),
                ),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text("Terima kasih."),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.015),
            ContactBox(),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
