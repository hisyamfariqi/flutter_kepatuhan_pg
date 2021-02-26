import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/drawer.dart';
import './components/body.dart';

class SubmitScreen extends StatelessWidget {
  static const String routeName = '/submit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Submit'),
      ),
      body: Body(),
    );
  }
}
