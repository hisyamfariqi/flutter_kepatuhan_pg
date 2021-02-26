import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/disabled_text_field_container.dart';
import 'package:flutter_kepatuhan_pg/constants.dart';

class DisabledTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const DisabledTextField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisabledTextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: primaryColor,
        enabled: false,
        style: TextStyle(fontSize: 12, color: Colors.black),
        focusNode: FocusNode(),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
