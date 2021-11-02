import 'package:flutter/material.dart';
import 'pages/configuration_page.dart';
import 'pages/classes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }

  late TabController _tabController;
  final List<Tab> topTabs = <Tab>[
    Tab(text: 'Classes'),
    Tab(text: 'Configuration'),
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
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(value: 0, child: Text("Settings")),
                    PopupMenuItem<int>(value: 0, child: Text("View Students")),
                  ])
        ],
        bottom: TabBar(
          tabs: topTabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: [
          Classes(),
          ConfigurationPage(),
        ],
        controller: _tabController,
      ),
    );
  }
}
