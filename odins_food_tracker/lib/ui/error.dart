import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('یه مشکلی پیش اومده دوباره وارد اپلیکیشن ات شو.'),
      ),
    );
  }
}
