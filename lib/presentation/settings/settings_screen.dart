import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key, this.schedule}) : super(key: key);

  final String schedule;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifs = false;
  String _schedule;

  void initState() {
    super.initState();
    _schedule = widget.schedule;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Choose Schedule'),
            DropdownButton<String>(
              value: _schedule,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  _schedule = newValue;
                });
              },
              items: <String>['Regular', 'Homeroom', 'Conference', 'Weekend']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        SwitchListTile(
          value: _notifs,
          title: Text("Period Notifications"),
          onChanged: (bool value) {
            setState(() {
              _notifs = !_notifs;
            });
          },
          secondary: const Icon(Icons.alarm),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: const Text('Sync Schedule'),
        ),
      ]),
    );
  }
}
