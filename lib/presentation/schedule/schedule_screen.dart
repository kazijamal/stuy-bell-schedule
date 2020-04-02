import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is the schedule screen"),
    );
  }
}
