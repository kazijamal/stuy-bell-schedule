import 'package:intl/intl.dart';

class ScheduleType {
  static String getCurrentDay() {
    DateTime date = DateTime.now();
    String day = DateFormat('EEEE').format(date);
    return day;
  }

  static String getDaySchedule(String day) {
    List<String> regular = ['Monday', 'Tuesday', 'Thursday', 'Friday'];
    List<String> weekend = ['Saturday', 'Sunday'];
    if (regular.contains(day)) {
      return 'regular';
    } else if (day == 'Wednesday') {
      return 'conference';
    } else if (weekend.contains(day)) {
      return 'weekend';
    }
    return 'invalid';
  }

  static String getCurrentSchedule() {
    return getDaySchedule(getCurrentDay());
  }
}
