import 'package:flutter/material.dart';

import '../../state/timer_computations.dart';

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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.schedule),
          Text(TimerComputations.getCurrentPeriod(widget.schedule)),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(TimerComputations.getMinutesInto(widget.schedule)
                      .toString()),
                  Text('Minutes Into', textAlign: TextAlign.center),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(TimerComputations.getMinutesLeft(widget.schedule)
                      .toString()),
                  Text('Minutes Left', textAlign: TextAlign.center),
                ],
              )),
            ],
          )
        ],
      ),
    ));
  }
}
