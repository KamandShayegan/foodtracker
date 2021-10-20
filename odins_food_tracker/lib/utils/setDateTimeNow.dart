import 'package:shamsi_date/shamsi_date.dart' show Gregorian, Jalali;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setDateTimeNow2SharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final DateTime now = DateTime.now();
  Gregorian g = Gregorian(now.year, now.month, now.day);
  Jalali j = Jalali.fromGregorian(g);
  prefs.setInt('day', j.day);
  prefs.setInt('month', j.month);
  prefs.setInt('year', j.year);
  return true;
}
