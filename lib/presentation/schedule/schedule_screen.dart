import 'package:flutter/material.dart';

import '../../state/schedule_data.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List _periods;
  List _times;

  void initState() {
    super.initState();
    _periods = ScheduleData.getPeriods(widget.schedule);
    _times = ScheduleData.getTimes(widget.schedule);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.schedule),
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
