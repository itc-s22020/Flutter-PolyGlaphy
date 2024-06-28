import 'package:flutter/material.dart';
import '../getX/navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello Flutter!'),
            ElevatedButton(onPressed: toPolyGraphyPage, child:Text("NextPage"))
          ],
        )
      ),
    );
  }
}

