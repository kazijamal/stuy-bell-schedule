import 'package:flutter/material.dart';

class Period extends StatelessWidget {
  Period({Key key, this.value}) : super(key: key);

  final String value;
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
            width: 150.0,
            height: 35.0,
            child: Material(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$value',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    ));
  }
}
