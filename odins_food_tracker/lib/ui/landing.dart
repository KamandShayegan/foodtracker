import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                // radius: 80,
                maxRadius: MediaQuery.of(context).size.width * 0.4,
                minRadius: 20,
                foregroundImage: const AssetImage('assets/odin.jpg')),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'FOOD TIME!',
              style: TextStyle(fontSize: 60, fontFamily: 'FunFont'),
            ),
          ],
        ),
      ),
    );
  }
}
