import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../state/schedule_type.dart';
import '../../state/timer_computations.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  String _schedule;
  String _period;
  int _minutesInto;
  int _minutesLeft;
  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();
    _setScheduleSharedPrefs();
  }

  @override
  void dispose() {
    super.dispose();
    _everySecond.cancel();
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
      });
    } else {
      setState(() {
        _schedule = schedule;
      });
    }
    setState(() {
      _period = TimerComputations.getCurrentPeriod(_schedule);
      _minutesInto = TimerComputations.getMinutesInto(_schedule);
      _minutesLeft = TimerComputations.getMinutesLeft(_schedule);
      _now = DateFormat('jms').format(DateTime.now());

      _everySecond = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
        setState(() {
          _minutesInto = TimerComputations.getMinutesInto(_schedule);
          _minutesLeft = TimerComputations.getMinutesLeft(_schedule);
          _now = DateFormat('jms').format(DateTime.now());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_schedule),
          Text(_period),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text('$_minutesInto'),
                  Text('Minutes Into'),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text('$_minutesLeft'),
                  Text('Minutes Left'),
                ],
              )),
            ],
          ),
          Text('$_now'),
        ],
      ),
    ));
  }
}
