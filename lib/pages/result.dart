import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getX/file_controller.dart';
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
              ElevatedButton(onPressed: toOffHomePage, child:Text("HomePage")),
              ElevatedButton(onPressed: obsFilePrint, child: Text("print file"))
            ],
          )
      ),
    );
  }
}

void obsFilePrint() {
  final FileController c = Get.put(FileController());
  if (kDebugMode) {
    print(c.getFile());
  }
}