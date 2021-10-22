import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odins_food_tracker/ui/homepage.dart';
import 'package:odins_food_tracker/ui/landing.dart';
import 'package:odins_food_tracker/utils/check_if_tomorrow.dart';
import 'package:odins_food_tracker/utils/setDateTimeNow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 10, fontFamily: 'IranSans', color: Colors.white),
            headline2: TextStyle(
                fontFamily: 'funfont', fontSize: 80, color: Colors.white)),
        unselectedWidgetColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      routes: <String, Widget Function(BuildContext)>{
        '/': (_) => const MyStartingPage(),
        '/homepage': (_) => const HomePage(),
      },
    );
  }
}

class MyStartingPage extends StatefulWidget {
  const MyStartingPage({Key? key}) : super(key: key);
  @override
  State<MyStartingPage> createState() => _MyStartingPageState();
}

class _MyStartingPageState extends State<MyStartingPage> {
  Future<bool> _delay() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    return true;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await checkIfTomorrow();
      setDateTimeNow2SharedPreferences();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _delay(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LandingPage();
          }
        },
      ),
    );
  }
}
