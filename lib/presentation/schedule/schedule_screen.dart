import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state/schedule_data.dart';
import '../../state/schedule_type.dart';

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
    String schedule = await _getScheduleSharedPrefs();
    if (schedule == null) {
      setState(() {
        _schedule = ScheduleType.getCurrentSchedule();
        _periods = ScheduleData.getPeriods(schedule);
        _times = ScheduleData.getTimes(schedule);
      });
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
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_schedule),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[for (var item in _periods) Text(item)],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[for (var item in _times) Text(item)],
              ),
            ),
          ],
        ),
      ],
    )));
  }
}
