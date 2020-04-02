import './schedule_time_constants.dart';

class TimerComputations {
  static const scheduleMap = {
    "regular": ScheduleTimeConstants.REGULAR_SCHEDULE,
    "homeroom": ScheduleTimeConstants.HOMEROOM_SCHEDULE,
    "conference": ScheduleTimeConstants.CONFERENCE_SCHEDULE
  };

  static int getTime() {
    var now = DateTime.now();
    var startms =
        (new DateTime(now.year, now.month, now.day)).millisecondsSinceEpoch;
    int startTime = (startms / 1000).round();

    var currentms = (new DateTime.now()).millisecondsSinceEpoch;
    int currentTime = (currentms / 1000).round();

    return currentTime - startTime;
  }

  static String getCurrentPeriod(String schedule) {
    int time = getTime();

    for (var period in scheduleMap[schedule].keys) {
      int start = scheduleMap[schedule][period]['start'];
      int end = scheduleMap[schedule][period]['end'];
      if (time >= start && time < end) {
        return period;
      }
    }

    return "invalid";
  }

  static int getMinutesInto(String schedule) {
    int time = getTime();
    String period = getCurrentPeriod(schedule);
    int start = scheduleMap[schedule][period]['start'];
    return ((time - start) / 60).round();
  }

  static int getMinutesLeft(String schedule) {
    int time = getTime();
    String period = getCurrentPeriod(schedule);
    int end = scheduleMap[schedule][period]['end'];
    return ((end - time) / 60).round();
  }
}
