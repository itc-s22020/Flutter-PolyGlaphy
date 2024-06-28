import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:polygraphy/getX/navigation.dart';

import '../getX/file_controller.dart';

class PolyGraphy extends StatelessWidget {
  const PolyGraphy({super.key});

  @override
  Widget build(BuildContext context) {
    final FileController c = Get.put(FileController());
    c.setFile(Uint8List(8));
    return const Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('polyGraphy'),
              ElevatedButton(onPressed: toHomePage, child: Text("BackPage")),
              ElevatedButton(onPressed: toResultPage, child: Text("NextPage"))
            ],
          )
      ),
    );
  }
}


