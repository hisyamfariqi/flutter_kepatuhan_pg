import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/routes.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text(
          //     'Pernyataan Kepatuhan',
          //     style: TextStyle(color: Colors.yellow, fontSize: 25),
          //   ),
          // decoration: BoxDecoration(
          //     color: primaryColor,
          //     image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AssetImage('assets/images/icon_home.png'))),
          // ),
          ListTile(
            title: Text('Pernyataan Kepatuhan'),
          ),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(
            icon: Icons.input,
            text: 'Submit',
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.submit);
            },
          ),
        ],
      ),
    );
  }
}

Widget _createDrawerItem({
  IconData icon,
  String text,
  GestureTapCallback onTap,
}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
