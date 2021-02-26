import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/components/drawer.dart';
import './components/body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Body(),
    );
  }
}
