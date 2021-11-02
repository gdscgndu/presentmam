import 'package:flutter/material.dart';
import 'package:presentmam/homepage.dart';
import 'package:presentmam/splash.dart';
import 'pages/settings_page.dart';
import 'pages/attendance_page.dart';
import 'pages/subjects_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/settings' : (context) => Settings(),
        '/attendance' :(context) => AttendancePage(),
        '/subjects' :(context) => Subjects(),
        '/homepage': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Present Mam',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}
