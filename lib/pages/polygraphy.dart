import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyglot/jpeg/jpeg_polyglot.dart';
import 'package:polyglot/png/png_polyglot.dart';
import 'package:polygraphy/components/check_extension.dart';
import 'package:polygraphy/components/file_pick.dart';
import 'package:polygraphy/getX/cover_controller.dart';
import 'package:polygraphy/getX/data_controller.dart';
import 'package:polygraphy/getX/navigation.dart';
import 'package:polygraphy/getX/polyglot_controller.dart';

class PolyGraphy extends StatelessWidget {
  const PolyGraphy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('polyGraphy'),
              ElevatedButton(onPressed: _toResult, child: const Text("NextPage")),
              const ElevatedButton(onPressed: filePick, child: Text("polyglotData Pick")),
              const ElevatedButton(onPressed: toHomePage, child: Text("BackPage")),
            ],
          )
      ),
    );
  }

  Future<void> _toResult() async {
    toResultPage();
    Future.delayed(Duration.zero, () async {
      final CoverController coverC = Get.put(CoverController());
      final DataController dataC = Get.put(DataController());

      final coverData = coverC.getFile();
      final data = dataC.getFile();
      await polyglotGenerate(coverData, data);
    });
  }

  Future<void> polyglotGenerate(Uint8List coverData, Uint8List data) async {
    final String? ext = checkExtensions(coverData);
    final PolyglotController polyglotC = Get.put(PolyglotController());
    switch(ext){
      case 'png':
        final Uint8List polyglotData = pngPolyglot(coverData, data);
        polyglotC.setFile(polyglotData);
        break;
      case 'jpg':
        final Uint8List polyglotData = jpegPolyglot(coverData, data);
        polyglotC.setFile(polyglotData);
        break;
      default:
        break;
    }
  }
}


