import 'package:time_elapsed/time_elapsed.dart';

DateTime secondsFromEpochToDateTime(int dateInt) {
  return DateTime.fromMillisecondsSinceEpoch(dateInt * 1000, isUtc: true);
}

String formatTime(DateTime time) {
  return TimeElapsed.fromDateTime(time);
}
