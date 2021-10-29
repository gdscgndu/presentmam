import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';

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
      onPressed: () async{
        var picked = await FilePicker.platform.pickFiles();
        if (picked != null) {
          PlatformFile file = picked.files.first;
          var pathoffile=file.path.toString();
          final input = new File(pathoffile).openRead();
          final fields = await input
              .transform(utf8.decoder)
              .transform(new CsvToListConverter())
              .toList();
          var data='';
          for(int i=0;i<fields.length;i++){
            data+=fields[i][0]+fields[i][1].toString()+"\n";
          }
          setState(() {
            filename = data;
          });
          // print(picked.files.first.bytes);
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
