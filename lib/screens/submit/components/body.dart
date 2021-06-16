import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/disabled_text_field.dart';
import 'package:flutter_kepatuhan_pg/models/hasil_jawaban_model.dart';
import 'package:flutter_kepatuhan_pg/constants.dart';
import 'package:http/http.dart' as http;
import './background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int idPertanyaan = 0, periode = 0;
  String nik = "";
  List data;
  List pertanyaan, jawaban, karyawan;
  List pertanyaans = [], jawabans = [];
  var isLoading = true, emptyData;
  bool checkBox = false;

  List<HasilJawabanModel> hasilModel = [
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
    HasilJawabanModel(
        nik: null, periode: null, idPertanyaan: null, jawaban: null),
  ];

  // Map hasilJawaban = {
  //   "1": null,
  //   "2": null,
  //   "3": null,
  //   "4": null,
  //   "5": null,
  //   "6": null,
  //   "7": null,
  //   "8": null,
  //   "9": null,
  //   "10": null,
  //   "11": null
  // };

  Future<String> getKaryawan() async {
    var response = await http.get(
      Uri.encodeFull("http://localhost:3000/getkaryawan"),
    );
    this.setState(() {
      karyawan = jsonDecode(response.body);
      isLoading = false;
      if (karyawan.length == 0) {
        emptyData = true;
      } else {
        emptyData = false;
      }
    });
  }

  Future<String> getJawaban() async {
    var response = await http.get(
      Uri.encodeFull("http://localhost:3000/getjawaban"),
    );
    this.setState(() {
      jawaban = jsonDecode(response.body);
      isLoading = false;
      if (jawaban.length == 0) {
        emptyData = true;
      } else {
        emptyData = false;
      }
    });
  }

  Future<String> getPertanyaan() async {
    var response = await http.get(
      Uri.encodeFull("http://localhost:3000/getpertanyaan"),
    );
    this.setState(() {
      pertanyaan = jsonDecode(response.body);
      isLoading = false;
      if (pertanyaan.length == 0) {
        emptyData = true;
      } else {
        emptyData = false;
      }
    });
  }

  Widget customRadio(int nomor) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: <Widget>[
          ListTile(
            title: textJawaban(nomor, this.idPertanyaan),
            leading: Radio(
              value: textJawaban(nomor, idPertanyaan).toString(),
              groupValue: hasilModel[nomor],
              onChanged: (var value) {
                setState(() {
                  // hasilJawaban[(nomor + 1).toString()] = value;
                  hasilModel[nomor] = HasilJawabanModel(
                      nik: this.nik,
                      periode: this.periode,
                      idPertanyaan: this.idPertanyaan,
                      jawaban: value);

                  // print(_answer);
                });
              },
            ),
          ),
          ListTile(
            title: textJawaban(nomor + 1, this.idPertanyaan),
            leading: Radio(
              value: textJawaban(nomor + 1, idPertanyaan).toString(),
              groupValue: hasilModel[nomor],
              onChanged: (var value) {
                setState(() {
                  // hasilJawaban[(nomor + 1).toString()] = value;
                  hasilModel[nomor] = HasilJawabanModel(
                      nik: this.nik,
                      periode: this.periode,
                      idPertanyaan: this.idPertanyaan,
                      jawaban: value);
                  // jawaban[nomor.toString()] = _answer;
                  // print(_answer);
                });
              },
            ),
          ),
        ],
      );
    });
  }

  Widget textPertanyaan(int index, int periode) {
    if (pertanyaan.isNotEmpty) {
      if (periode != 0) {
        setState(() {
          pertanyaans = pertanyaan
              .where((element) => element["Periode"] == periode)
              .toList();
          this.idPertanyaan = pertanyaans[index]["Id"];
        });
        return Text(
            (index + 1).toString() + ". " + pertanyaans[index]["Pertanyaan"]);
      } else {
        return Text("No data");
      }
    } else {
      return Text("No data");
    }
  }

  Widget textJawaban(int index, int idPertanyaan) {
    if (jawaban.isNotEmpty) {
      if (idPertanyaan != 0) {
        setState(() {
          jawabans = jawaban
              .where((element) => element["IdPertanyaan"] == idPertanyaan)
              .toList();
        });
        return Text(jawabans[index]["Jawaban"]);
      } else {
        return Text("No data");
      }
    } else {
      return Text("No data");
    }
  }

  questionnareDialog() {
    // int radioValue;
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text("Kuisioner Uji Kelayakan Anti Penyuapan Karyawan"),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        textPertanyaan(index, this.periode),
                        customRadio(index),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text("Submit"),
                  onPressed: () {
                    // print(hasilJawaban);
                    submitHasil();
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
      },
    );
  }

  Future<HasilJawabanModel> submitHasil() async {
    final String url = "http://localhost:3000/hasilJawaban";
    final response = await http.post(url, body: jsonEncode(hasilModel));

    if (response.statusCode == 200) {
      print(response.body);
      return hasilJawabanModelFromJson(response.body);
    } else {
      print("Failed to post");
      return null;
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      // Here you can write your code
      emptyData = false;
      this.getKaryawan();
      this.periode = karyawan[0]["Periode"];
      this.nik = karyawan[0]["NIK"];
      this.getPertanyaan();
      this.getJawaban();
      questionnareDialog();
      setState(() {
        // Here you can write your code for open new view
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // void handleRadioValue(int value) {}

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
                  InformationRow(
                      text: "Nama/NIK",
                      formText: karyawan[0]["NIK"],
                      width: 10),
                  InformationRow(
                      text: "Unit Kerja",
                      formText: karyawan[0]["UNITKERJA"],
                      width: 10),
                  InformationRow(
                      text: "Jabatan",
                      formText: karyawan[0]["JABATAN"],
                      width: 10),
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
                    value: this.checkBox,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool value) {
                      setState(() {
                        this.checkBox = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            FlatButton(
              color: submitButtonColor,
              onPressed: () => null,
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
  final String formText;
  final double width;
  const InformationRow({
    Key key,
    this.text,
    this.formText,
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
            hintText: formText,
          ),
        ],
      ),
    );
  }
}
