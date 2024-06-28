import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolyGraphyPage extends StatelessWidget {
  const PolyGraphyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Hello Flutter!'
              ),
              ElevatedButton(onPressed: _toHomePage, child: Text("backPage"))
            ],
          )
      ),
    );
  }
}

void _toHomePage() {
  Get.back();
}