import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
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
