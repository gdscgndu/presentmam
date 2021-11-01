import 'package:flutter/material.dart';

class Subjects extends StatelessWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget subjectBtn(String subname) {
      return MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/attendance');
        },
        child: Text(subname,
            style: TextStyle(
              color: Colors.white,
            )),
        height: 50.0,
        minWidth: 200.0,
        color: Colors.blue,
        elevation: 10.0,
        highlightElevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Subjects"),
        ),
        body: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: subjectBtn("Maths"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: subjectBtn("Maths"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: subjectBtn("Maths"),
                ),
              ],
            )
          ],
        )));
  }
}
