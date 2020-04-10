import 'package:intl/intl.dart';

import './schedule_time_constants.dart';

class ScheduleData {
  static const scheduleMap = {
    "Regular": ScheduleTimeConstants.REGULAR_SCHEDULE,
    "Homeroom": ScheduleTimeConstants.HOMEROOM_SCHEDULE,
    "Conference": ScheduleTimeConstants.CONFERENCE_SCHEDULE,
    "Weekend": ScheduleTimeConstants.WEEKEND_SCHEDULE
  };

  static List getPeriods(String schedule) {
    List<String> periods = new List();
    for (var period in scheduleMap[schedule].keys) {
      if (period.split(' ')[0] != 'Between') {
        periods.add(period);
      }
    }
    return periods;
  }

  static List getTimes(String schedule) {
    List<String> times = new List();

    if (schedule == 'Weekend') {
      times.add('Saturday - Sunday');
    } else {
      var now = DateTime.now();
      var startms =
          (new DateTime(now.year, now.month, now.day)).millisecondsSinceEpoch;

      for (var period in scheduleMap[schedule].keys) {
        if (period.split(' ')[0] != 'Between') {
          int start = 1000 * scheduleMap[schedule][period]['start'];
          start += startms;
          int end = 1000 * scheduleMap[schedule][period]['end'];
          end += startms;
          var startDate = DateFormat.jm()
              .format(new DateTime.fromMillisecondsSinceEpoch(start));
          var endDate = DateFormat.jm()
              .format(new DateTime.fromMillisecondsSinceEpoch(end));
          String formatted = '$startDate' + ' - ' + '$endDate';
          times.add(formatted);
        }
      }
    }

    return times;
  }
}
