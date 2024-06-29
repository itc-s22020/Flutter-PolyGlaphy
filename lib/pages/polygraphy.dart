import 'package:flutter/material.dart';
import 'package:polygraphy/getX/navigation.dart';

class PolyGraphy extends StatelessWidget {
  const PolyGraphy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('polyGraphy'),
              ElevatedButton(onPressed: toHomePage, child: Text("BackPage")),
              ElevatedButton(onPressed: toResultPage, child: Text("NextPage")),
            ],
          )
      ),
    );
  }
}


