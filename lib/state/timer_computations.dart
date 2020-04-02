// compute time differences to display on the timer screen
import 'package:intl/intl.dart';

import './schedule_time_constants.dart';

const regular = ScheduleTimeConstants.REGULAR_SCHEDULE;
const homeroom = ScheduleTimeConstants.HOMEROOM_SCHEDULE;
const conference = ScheduleTimeConstants.CONFERENCE_SCHEDULE;

class TimerComputations {
  static const schedules = {
    "regular": ScheduleTimeConstants.REGULAR_SCHEDULE,
    "homeroom": ScheduleTimeConstants.HOMEROOM_SCHEDULE,
    "conference": ScheduleTimeConstants.CONFERENCE_SCHEDULE
  };

  static String getCurrentPeriod(String schedule) {
    var now = DateTime.now();
    var startms =
        (new DateTime(now.year, now.month, now.day)).millisecondsSinceEpoch;
    int startTime = (startms / 1000).round();

    var currentms = (new DateTime.now()).millisecondsSinceEpoch;
    int currentTime = (currentms / 1000).round();

    int time = currentTime - startTime;
  }
}
