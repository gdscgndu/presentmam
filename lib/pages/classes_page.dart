import 'package:flutter/material.dart';

class Classes extends StatelessWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget classBtn(String subname) {
      return MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/subjects');
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

    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[ Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top:10.0),
                child:classBtn("B.Tech CSE"),
            ),

            Padding(
              padding: EdgeInsets.only(top:10.0),
              child:classBtn("B.Tech ECE"),
            ),

          ],
        ),
        ]
      ),
    );
  }
}
