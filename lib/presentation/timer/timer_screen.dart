import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  String _dayType = 'regular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is the timer screen'),
    );
  }
}
