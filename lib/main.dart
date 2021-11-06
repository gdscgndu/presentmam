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
        '/settings': (context) => Settings(),
        '/attendance': (context) => AttendancePage(),
        '/subjects': (context) => Subjects(),
        '/homepage': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Present Mam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Removed Splash Screen Widget.
      // Will handel the splash screen natively. This will show splash screen while the app is loading
      home: HomePage(),
    );
  }
}
