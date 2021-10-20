import 'package:flutter/material.dart';

class AppBarContents extends StatelessWidget {
  const AppBarContents({
    Key? key,
    required this.persianDateTimeNow,
  }) : super(key: key);

  final String persianDateTimeNow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ODIN',
          style: Theme.of(context).textTheme.headline2,
          //headline2
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          persianDateTimeNow,
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
