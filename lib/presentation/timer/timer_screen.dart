import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is the timer screen'),
    );
  }
}
