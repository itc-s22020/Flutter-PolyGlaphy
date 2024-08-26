import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyglot/jpeg/jpeg_polyglot.dart';
import 'package:polyglot/png/png_polyglot.dart';
import 'package:polygraphy/components/file_pick.dart';
import 'package:polygraphy/getX/cover_controller.dart';
import 'package:polygraphy/getX/data_controller.dart';
import 'package:polygraphy/getX/navigation.dart';
import 'package:polygraphy/getX/polyglot_controller.dart';

class PolyGraphy extends StatelessWidget {
  const PolyGraphy({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController dataC = Get.put(DataController());
    final CoverController coverC = Get.find<CoverController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PolyGraphy'),
        leading: const IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: toHomePage,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_present,
                          size: 64, color: Colors.green),
                      const SizedBox(height: 16),
                      Obx(() {
                        if (dataC.file.value.isNotEmpty) {
                          String fileName = dataC.fileName.value;
                          String fileSize =
                              '${(dataC.file.value.length / 1024).toStringAsFixed(2)} KB';
                          return Column(
                            children: [
                              Text('File: $fileName',
                                  style: const TextStyle(fontSize: 18)),
                              Text('Size: $fileSize',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          );
                        } else {
                          return const Text(
                            'No polyglot data selected',
                            style: TextStyle(fontSize: 18),
                          );
                        }
                      }),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.file_upload, color: Colors.white),
                        label: const Text("Select Polyglot Data"),
                        onPressed: () async {
                          await filePick();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                          Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton.icon(
                  icon: const Icon(Icons.navigate_next, color: Colors.white),
                  label: const Text("Generate Polyglot"),
                  onPressed: (coverC.file.value.isNotEmpty &&
                          dataC.file.value.isNotEmpty)
                      ? () => toResult()
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange.shade600,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> toResult() async {
    toResultPage();
    Future.delayed(Duration.zero, () async {
      final CoverController coverC = Get.find<CoverController>();
      final DataController dataC = Get.find<DataController>();

      final coverData = coverC.getFile();
      final data = dataC.getFile();
      await polyglotGenerate(coverData, data);
    });
  }

  Future<void> polyglotGenerate(Uint8List coverData, Uint8List data) async {
    final PolyglotController polyglotC = Get.put(PolyglotController());
    final CoverController coverC = Get.put(CoverController());
    final String ext = coverC.getExtension();
    switch (ext) {
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
