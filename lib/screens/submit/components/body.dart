import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/disabled_text_field.dart';
import 'package:flutter_kepatuhan_pg/components/radio_button.dart';
import 'package:flutter_kepatuhan_pg/constants.dart';
import './background.dart';

class UserChoice {
  String choice;
  int index;
  UserChoice({this.index, this.choice});
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // void handleRadioValue(int value) {}

    questionnareDialog(BuildContext context) {
      // int radioValue;
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Kuisioner Uji Kelayakan Anti Penyuapan Karyawan"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                      "1. Apakah Anda mengetahui tentang Sistem Manajemen Anti Penyuapan (SMAP) di PT Petrokimia Gresik?"),
                  CustomRadio(),
                  Text(
                      "2. Apakah Anda mengetahui tentang prinsip 4 NO dalam Sistem Manajemen Anti Penyuapan (SMAP)?"),
                  CustomRadio(),
                  Text(
                      "3. Apakah Anda mengetahui Whistle Blowing System (WBS) PT Petrokimia Gresik?"),
                  CustomRadio(),
                  Text(
                      "4. Apakah Pengelolaan WBS PT Petrokimia Gresik sudah berjalan sesuai harapan Anda?"),
                  CustomRadio(),
                  Text(
                      "5. Apakah Penting WBS dikelola oleh Pihak Ketiga untuk meningkatkan independensi dan transparansi?"),
                  CustomRadio(),
                  Text(
                      "6. Apakah Anda mengetahui tentang Gratifikasi yang Dianggap Suap?"),
                  CustomRadio(),
                  Text(
                      "7. Apakah Anda pernah mendapatkan sosialisasi Anti Gratifikasi?"),
                  CustomRadio(),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Submit"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/Petrokimia_Gresik_logo_long.png",
              width: size.width * 0.6,
            ),
            // // Big Text Page Title
            Text(
              "Pernyataan Kepatuhan",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Saya yang bertandatangan di bawah ini: ",
                      style: TextStyle(fontSize: 12)),
                  InformationRow(text: "Nama/NIK", width: 10),
                  InformationRow(text: "Unit Kerja", width: 10),
                  InformationRow(text: "Jabatan", width: 10),
                  Text("Dengan ini menyatakan: ",
                      style: TextStyle(fontSize: 12)),
                  Text(
                      "1. Telah membaca dan memahami Pedoman Etika Bisnis dan Etika Kerja",
                      style: TextStyle(fontSize: 12)),
                  Text(
                      "2. Berjanji akan mematuhi dengan sebaik-baiknya semua kebijakan-kebijakan dan etika-etika yang tercantum di dalam Pedoman Etika Bisnis dan Etika Kerja",
                      style: TextStyle(fontSize: 12)),
                  Text(
                      "3. Bersedia untuk dikenakan sanksi sebagaimana diatur dalam Pedoman Etika Bisnis dan Etika Kerja ini sebagai akibat tidak menaati dan atau mematuhi pedoman ini",
                      style: TextStyle(fontSize: 12)),
                  CheckboxListTile(
                    title: Text(
                        "Demikian pernyataan ini saya berikan dengan sadar, tanpa ada paksaan dari pihak manapun dan bersedia menanggung semua konsekuensi dari pelanggaran atas pernyataan ini",
                        style: TextStyle(fontSize: 10, color: Colors.blue)),
                    value: false,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (newValue) {},
                  ),
                ],
              ),
            ),
            FlatButton(
              color: submitButtonColor,
              onPressed: () => questionnareDialog(context),
              child: Text("Submit",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationRow extends StatelessWidget {
  final String text;
  final double width;
  const InformationRow({
    Key key,
    this.text,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: 0,
        right: size.width * 0.055,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: width),
          DisabledTextField(
            hintText: text,
          ),
        ],
      ),
    );
  }
}
