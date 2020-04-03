import 'package:flutter/material.dart';

import './presentation/schedule/schedule_screen.dart';
import './presentation/timer/timer_screen.dart';
import './presentation/settings/settings_screen.dart';

import './state/schedule_type.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [ScheduleScreen(), TimerScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stuyvesant Bell Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stuyvesant Bell Schedule'),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.view_list), title: Text('Schedule')),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule), title: Text('Timer')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Settings'))
          ],
        ),
      ),
    );
  }
}
