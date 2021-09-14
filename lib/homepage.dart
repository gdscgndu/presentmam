import 'package:flutter/material.dart';
import 'pages/attendance_page.dart';
import 'pages/configuration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> topTabs = <Tab>[
    Tab(text: 'HomePage'),
    Tab(text: 'Attendance Page'),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Present Mam',
          style: TextStyle(fontFamily: 'avenir', fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          tabs: topTabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: [
          ConfigurationPage(),
          AttendancePage(),
        ],
        controller: _tabController,
      ),
    );
  }
}
