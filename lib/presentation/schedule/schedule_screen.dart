import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state/schedule_data.dart';
import '../../state/schedule_type.dart';

import './period.dart';
import './time.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String _schedule;
  List _periods;
  List _times;

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
      String newSchedule = ScheduleType.getCurrentSchedule();
      setState(() {
        _schedule = newSchedule;
        _periods = ScheduleData.getPeriods(newSchedule);
        _times = ScheduleData.getTimes(newSchedule);
      });
      await prefs.setString('schedule', newSchedule);
    } else {
      setState(() {
        _schedule = schedule;
        _periods = ScheduleData.getPeriods(schedule);
        _times = ScheduleData.getTimes(schedule);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _schedule == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _schedule,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            for (var value in _periods) Period(value: value)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            for (var value in _times) Time(value: value)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
