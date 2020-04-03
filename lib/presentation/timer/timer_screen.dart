import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../state/timer_computations.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  String _period;
  int _minutesInto;
  int _minutesLeft;
  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();

    _period = TimerComputations.getCurrentPeriod(widget.schedule);
    _minutesInto = TimerComputations.getMinutesInto(widget.schedule);
    _minutesLeft = TimerComputations.getMinutesLeft(widget.schedule);
    _now = DateFormat('jms').format(DateTime.now());

    _everySecond = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      setState(() {
        _minutesInto = TimerComputations.getMinutesInto(widget.schedule);
        _minutesLeft = TimerComputations.getMinutesLeft(widget.schedule);
        _now = DateFormat('jms').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _everySecond.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.schedule),
          Text('$_period'),
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
