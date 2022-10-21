import 'package:timeago/timeago.dart' as timeago;

DateTime secondsFromEpochToDateTime(int dateInt) {
  return DateTime.fromMillisecondsSinceEpoch(dateInt * 1000, isUtc: true);
}

String formatTime(DateTime time) {
  return timeago.format(time);
}
