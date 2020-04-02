import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String _dayType = 'regular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is the schedule screen'),
    );
  }
}
