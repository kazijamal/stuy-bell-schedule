// compute time differences to display on the timer screen
import 'package:intl/intl.dart';

import './schedule_time_constants.dart';

class TimerComputations {
  static const scheduleMap = {
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

    for (var period in scheduleMap[schedule].keys) {
      var start = scheduleMap[schedule][period]['start'];
      var end = scheduleMap[schedule][period]['end'];
      if (time >= start && time < end) {
        return period;
      }
    }

    return "invalid";
  }
}
