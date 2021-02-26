import 'package:flutter/material.dart';

class DisabledTextFieldContainer extends StatelessWidget {
  final Widget child;
  const DisabledTextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.only(left: 10),
      width: size.width * 0.6,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: child,
    );
  }
}
