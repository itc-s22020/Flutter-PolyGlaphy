import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'package:polygraphy/getX/polyglot_controller.dart';
import '../getX/navigation.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  void _downloadFile(Uint8List fileData, String fileName) {
    final blob = html.Blob([fileData]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final PolyglotController polyglotC = Get.put(PolyglotController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('PolyGraphy Result'),
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
                  child: Obx(() {
                    if (polyglotC.file.value.isNotEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.memory(
                            polyglotC.file.value,
                            fit: BoxFit.contain,
                            height: 200,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'File Size: ${(polyglotC.file.value.length / 1024).toStringAsFixed(2)} KB',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.download),
                            label: const Text("Download File"),
                            onPressed: () => _downloadFile(polyglotC.file.value, "polyglot_data.png"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No file available',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text("Home"),
              onPressed: toHomePage,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.orange.shade600,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

