import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/notifiers.dart';
import 'package:flutter_kepatuhan_pg/screens/home/home_screen.dart';
import 'package:flutter_kepatuhan_pg/screens/submit/submit_screen.dart';
import 'package:provider/provider.dart';
import './constants.dart';
import './screens/login/login_screen.dart';
import 'routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PekaPG',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.submit: (context) => SubmitScreen(),
      },
    );
  }
}
