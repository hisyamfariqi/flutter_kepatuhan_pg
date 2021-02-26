import 'package:flutter/material.dart';

class UserChoice {
  String choice;
  int index;
  UserChoice({this.index, this.choice});
}

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupState createState() => RadioGroupState();
}

class RadioGroupState extends State<RadioGroup> {
  String defaultChoice = "Sudah";
  int defaultIndex = 0;

  List<UserChoice> choices = [
    UserChoice(index: 0, choice: "Sudah"),
    UserChoice(index: 1, choice: "Belum")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Container(
              child: Column(
                children: choices
                    .map(
                      (e) => RadioListTile(
                        title: Text('${e.choice}'),
                        value: e.index,
                        groupValue: defaultIndex,
                        onChanged: (value) {
                          setState(() {
                            defaultChoice = e.choice;
                            defaultIndex = e.index;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        )
      ],
    );
  }
}
