import 'package:flutter/material.dart';
import 'package:polygraphy/components/cover_file_pick.dart';
import 'package:polygraphy/components/file_pick.dart';
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
            ElevatedButton(onPressed: toPolyGraphyPage, child:Text("NextPage")),
            ElevatedButton(onPressed: coverFilePick, child: Text("FilePick"))
          ],
        )
      ),
    );
  }
}

