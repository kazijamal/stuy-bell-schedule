import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state/schedule_type.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifs = false;
  String _schedule;

  void initState() {
    super.initState();
    _setScheduleSharedPrefs();
  }

  Future<String> _getScheduleSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final schedule = prefs.getString('schedule');
    return schedule;
  }

  Future<void> _setScheduleSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String schedule = await _getScheduleSharedPrefs();
    if (schedule == null) {
      setState(() {
        _schedule = ScheduleType.getCurrentSchedule();
      });
    } else {
      setState(() {
        _schedule = schedule;
      });
    }
  }

  Future<void> _updateScheduleSharedPrefs(String newSchedule) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('schedule', newSchedule);
    await prefs.setBool('sync', false);
    setState(() {
      _schedule = newSchedule;
    });
  }

  Future<void> _syncSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sync', true);
    String newSchedule = ScheduleType.getCurrentSchedule();
    await prefs.setString('schedule', newSchedule);
    _setScheduleSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Choose Schedule'),
            DropdownButton<String>(
              value: _schedule,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: (String newSchedule) {
                _updateScheduleSharedPrefs(newSchedule);
              },
              items: <String>['Regular', 'Homeroom', 'Conference', 'Weekend']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        SwitchListTile(
          value: _notifs,
          title: Text("Period Notifications"),
          onChanged: (bool value) {
            setState(() {
              _notifs = !_notifs;
            });
          },
          secondary: const Icon(Icons.alarm),
        ),
        RaisedButton(
          onPressed: () {
            _syncSharedPrefs();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: const Text('Sync Schedule'),
        ),
      ]),
    );
  }
}
