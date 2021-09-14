import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'enums.dart';
import 'data.dart';
import 'menu_info.dart';
import 'pages/attendance_page.dart';
import 'pages/configuration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Should we keep App bar?'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.configuration)
                  return ConfigurationPage();
                else if (value.menuType == MenuType.markAttendance)
                  return AttendancePage();
                else
                  return Container(
                    child: Text('Nothing selected'),
                  );
                // we can add animation here : like the container flips
              },
            ),
          ),
          Divider(
            color: Colors.black87,
            height: 1,
          ),
          // Bottom Navigation menu
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          )
        ],
      )),
    );
  }
}

Widget buildMenuButton(MenuInfo currentMenuInfo) {
  return Consumer<MenuInfo>(
    builder: (BuildContext context, MenuInfo value, Widget? child) {
      return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26), topRight: Radius.circular(26))),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? Colors.blue[100]
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imagePath,
                scale: 1.5,
              ),
              Text(
                currentMenuInfo.title,
                style: TextStyle(fontSize: 14, fontFamily: 'avenir'),
              ),
            ],
          ));
    },
  );
}
