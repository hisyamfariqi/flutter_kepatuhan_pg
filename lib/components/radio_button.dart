import 'package:flutter/material.dart';

// class RadioModel {
//   bool isSelected;
//   final String buttonText;
//   final String text;

//   RadioModel({this.isSelected, this.buttonText, this.text});
// }

enum Answer { ya, tidak }

class CustomRadio extends StatefulWidget {
  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  // List<RadioModel> sampleData = <RadioModel>[];
  Answer _answer;

  // @override
  // void initState() {
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Ya'),
          leading: Radio(
            value: Answer.ya,
            groupValue: _answer,
            onChanged: (Answer value) {
              setState(() {
                _answer = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Tidak'),
          leading: Radio(
            value: Answer.tidak,
            groupValue: _answer,
            onChanged: (Answer value) {
              setState(() {
                _answer = value;
              });
            },
          ),
        )
      ],
    );
  }
}
