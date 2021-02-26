import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(150, 150, 174, 77),
          Color.alphaBlend(Colors.green, Colors.white)
        ]),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: size.height * 0.85,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
