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
      return 'Regular';
    } else if (day == 'Wednesday') {
      return 'Conference';
    } else if (weekend.contains(day)) {
      return 'Weekend';
    }
    return 'invalid';
  }

  static String getCurrentSchedule() {
    return getDaySchedule(getCurrentDay());
  }
}
