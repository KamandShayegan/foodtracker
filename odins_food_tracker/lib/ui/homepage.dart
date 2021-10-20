import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:odins_food_tracker/ui/appbar_contents.dart';
import 'package:odins_food_tracker/ui/each_meal_widget.dart';
import 'package:odins_food_tracker/ui/error.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firebase initialization ==>
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    //root: databse - firebase child: meals ==>
    final mealStatusReference = database.child('/meals');

    String persianDateTimeNow =
        DateTime.now().toPersianDateStr(showDayStr: true);

    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 160,
          elevation: 0,
          title: AppBarContents(persianDateTimeNow: persianDateTimeNow),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),

              //headline1
              const SizedBox(
                height: 32,
              ),
              StreamBuilder(
                stream: mealStatusReference.onValue,
                builder: (builder, snapshot) {
                  Widget resultWidget = const SizedBox();
                  if (ConnectionState.waiting == snapshot.connectionState) {
                    resultWidget = const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return _showDataRealTime(snapshot);
                  } else if (snapshot.hasError) {
                    resultWidget = const CustomErrorWidget();
                  }
                  return resultWidget;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showDataRealTime(AsyncSnapshot<Object?> snapshot) {
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          EachMeal(
            i: i,
            snapshot: snapshot,
          )
      ],
    );
  }
}
