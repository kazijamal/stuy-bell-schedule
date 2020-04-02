import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _dayType = 'regular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is the settings screen'),
    );
  }
}
