import 'package:firebase_database/firebase_database.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

checkIfTomorrow() async {
  final database = FirebaseDatabase.instance.reference();
  final mealStatusReference = database.child('/meals');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //get gregorian date:
  Gregorian g = Gregorian.now();
  //get saved date (NOTE: on first time, this data is null so we have to set some default value using ??) ==>
  int day = prefs.getInt('day') ?? 8;
  int month = prefs.getInt('month') ?? 1;
  int year = prefs.getInt('year') ?? 1399;
  //get saved data and today's datetime to compare ==>
  Jalali saved = Jalali(year, month, day);
  Jalali now = Jalali.fromGregorian(g);

//if this is the next day, then you wanna start all over, so might as well reset all data ==>
  bool isNotToday = !(saved == now);
  if (isNotToday) {
    mealStatusReference.child('breakfast').set(false);
    mealStatusReference.child('lunch').set(false);
    mealStatusReference.child('brunch').set(false);
    mealStatusReference.child('dinner').set(false);
  }
}
