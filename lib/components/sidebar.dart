import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kepatuhan_pg/routes.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<String> menuItems = [
    "Home",
    "Login",
    "Pernyataan Kepatuhan",
    "Dokumen PEBK"
  ];

  final List<String> menuIcons = [
    "icon_home",
    "icon_add",
    "icon_add",
    "icon_settings"
  ];

  bool sidebarOpen = false;

  double yOffset = 0;

  double xOffset = 60;

  double pageScale = 1;

  int selectedMenuItem = 0;

  String pageTitle = "Homepage";

  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? 265 : 60;
      yOffset = sidebarOpen ? 70 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  void setPageTitle() {
    switch (selectedMenuItem) {
      case 0:
        pageTitle = "HomePage";
        Navigator.pushReplacementNamed(context, Routes.home);
        break;
      case 1:
        pageTitle = "Pernyataan Kepatuhan";
        break;
      case 2:
        pageTitle = "Submit";
        break;
      case 3:
        pageTitle = "Dokumen PBEK";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Container(
                    color: Color(0xFF05ac4c),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            sidebarOpen = true;
                            setSidebarState();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              child:
                                  Image.asset("assets/images/icon_search.png")),
                        ),
                        Container(
                            child: Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20),
                                hintText: "Search here...",
                                hintStyle: TextStyle(
                                  color: Color(0xFFB666666),
                                )),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                      child: new ListView.builder(
                          itemCount: menuItems.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  sidebarOpen = false;
                                  selectedMenuItem = index;
                                  setSidebarState();
                                  setPageTitle();
                                },
                                child: MenuItem(
                                  itemIcon: menuIcons[index],
                                  itemText: menuItems[index],
                                  selected: selectedMenuItem,
                                  position: index,
                                ),
                              ))),
                ),
                Container(
                  child: MenuItem(
                    itemIcon: "icon_logout",
                    itemText: "Logout",
                    selected: selectedMenuItem,
                    position: menuItems.length + 1,
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(xOffset, yOffset, 1.0)
              ..scale(pageScale),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: sidebarOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(0)),
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            sidebarOpen = !sidebarOpen;
                            setSidebarState();
                          },
                          child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(20),
                              child: Icon(Icons.menu)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            pageTitle,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String itemText;
  final String itemIcon;
  final int selected;
  final int position;
  MenuItem({this.itemText, this.itemIcon, this.selected, this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? Color(0xFFB151E26) : Color(0xFF05ac4c),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/$itemIcon.png")),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemText,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
