import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  var filename = '';
  Widget uploadbtn() {
    return RaisedButton(
      child: Text('Upload'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();

        if (picked != null) {
          setState(() {
            filename = picked.files.first.name;
          });
          // print(picked.files.first.name);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              //child_2
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                Text("Upload Student data in CSV format"),
                uploadbtn(),
                Text("$filename"),
              ]))
        ],
      ),
    );
  }
}
