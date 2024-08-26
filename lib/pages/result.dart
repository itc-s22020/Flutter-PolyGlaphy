import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polygraphy/getX/cover_controller.dart';
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
    final CoverController coverC = Get.put(CoverController());

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
                      return FutureBuilder<Uint8List>(
                        future: Future.value(polyglotC.file.value),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  'Error loading image: ${snapshot.error}',
                                  style: const TextStyle(fontSize: 18, color: Colors.red),
                                ),
                              );
                            }
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InteractiveViewer(
                                    minScale: 0.5,
                                    maxScale: 4.0,
                                    child: Image.memory(
                                      snapshot.data!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'File Size: ${(snapshot.data!.length / 1024).toStringAsFixed(2)} KB',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.download, color: Colors.white),
                                    label: const Text("Download File"),
                                    onPressed: () => _downloadFile(polyglotC.file.value, "polyglot_data.${coverC.getExtension()}"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
                                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                      textStyle: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
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
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text("Home"),
              onPressed: toOffHomePage,
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