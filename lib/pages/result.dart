import 'package:flutter/material.dart';
import '../getX/navigation.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('result'),
              ElevatedButton(onPressed: toOffHomePage, child:Text("HomePage")),
            ],
          )
      ),
    );
  }
}
