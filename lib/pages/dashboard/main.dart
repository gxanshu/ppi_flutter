import 'package:flutter/material.dart';
import 'package:ppi/pages/dashboard/About.dart';
import 'package:ppi/pages/dashboard/complain.dart';
import 'package:ppi/pages/dashboard/home.dart';
import 'package:ppi/pages/dashboard/members.dart';
import 'package:ppi/pages/dashboard/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> screens = [
    const HomePage(),
    const MembersPage(),
    const SearchPage(),
    const ComplainPage(),
    const AboutPage()
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        //type: BottomNavigationBarType.fixed,
        onDestinationSelected: changeIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.groups), label: "Members"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(
              icon: Icon(Icons.personal_injury), label: "Complain"),
          NavigationDestination(icon: Icon(Icons.person), label: "About"),
        ],
      ),
    );
  }
}
