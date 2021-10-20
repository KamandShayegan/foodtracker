import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:odins_food_tracker/utils/meal_specifier.dart';

class EachMeal extends StatefulWidget {
  final int i;
  final AsyncSnapshot<Object?> snapshot;
  const EachMeal({Key? key, required this.i, required this.snapshot})
      : super(key: key);

  @override
  _EachMealState createState() => _EachMealState();
}

class _EachMealState extends State<EachMeal> {
  final database = FirebaseDatabase.instance.reference();

  List<bool> meals = [false, false, false, false];
  List<String> mealsString = ['صبحونه', 'ناهار', 'عصرونه', 'شام'];

  @override
  Widget build(BuildContext context) {
    final mealStatusReference = database.child('/meals');

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: CheckboxListTile(
          checkColor: Colors.blue,
          activeColor: Colors.white,
          // tileColor: Colors.blue.shade500,
          title: Text(
            mealsString[widget.i],
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontFamily: 'IranSans',
            ),
          ),
          value: ((widget.snapshot.data! as Event)
              .snapshot
              .value[mealSpecifier(widget.i)]),
          onChanged: (value) async {
            await mealStatusReference.child(mealSpecifier(widget.i)).set(value);
            setState(() {
              meals[widget.i] = value!;
            });
          }),
    );
  }
}
