import 'package:flutter/material.dart';

class MinutesLeft extends StatelessWidget {
  MinutesLeft({Key key, this.value}) : super(key: key);

  final int value;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: 100.0,
            height: 150.0,
            child: Material(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$value',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text('Minutes Left', style: TextStyle(fontSize: 18)),
      ],
    ));
  }
}
