import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<Student> students = <Student>[];
  late StudentDataSource studentDataSource;

  @override
  void initState() {
    super.initState();
    students = getStudentData();
    studentDataSource = StudentDataSource(studentData: students);
  }
  final DataGridController _dataGridController = DataGridController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mark Attendance'),
        ),
        body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  onPressed: () {
                    var _selectedRows = _dataGridController.selectedRows;
                    List<DataGridRow> data= _selectedRows;
                    for(int i=0;i<data.length;i++){
                      var nameval=data[i].getCells()[0].value;
                      var rollnoval=data[i].getCells()[1].value;
                      print(nameval);
                      print(rollnoval);
                    }
                  },
                  child: Text("Get values")),
              SfDataGrid(
                controller: _dataGridController,
                allowSorting: true,
                selectionMode: SelectionMode.multiple,
                source: studentDataSource,
                columnWidthMode: ColumnWidthMode.fill,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'Name',
                      label: Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Name',
                          ))),
                  GridColumn(
                      columnName: 'Roll No',
                      label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text('Roll No'))),
                ],
              ),
            ]));
  }

  List<Student> getStudentData() {
    return [
      Student("ABC", "1"),
      Student("DEF", "2"),
      Student("GHI", "3"),
      Student("JKL", "4"),
      Student("JKL", "4"),
      Student("JKL", "4"),
      Student("JKL", "4"),
      Student("JKL", "4"),
      Student("JKL", "4"),
      Student("JKL", "4"),
      Student("JKL", "4"),
    ];
  }
}

class Student {
  Student(this.name, this.rollno);
  final String name;
  final String rollno;
}

class StudentDataSource extends DataGridSource {
  StudentDataSource({required List<Student> studentData}) {
    _studentData = studentData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'rollno', value: e.rollno),
            ]))
        .toList();
  }

  List<DataGridRow> _studentData = [];

  @override
  List<DataGridRow> get rows => _studentData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
