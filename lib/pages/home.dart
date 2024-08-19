import 'package:flutter/material.dart';
import 'package:polygraphy/components/cover_file_pick.dart';
import '../getX/cover_controller.dart';
import '../getX/navigation.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final CoverController coverController = Get.put(CoverController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('PolyGraphy'),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (coverController.file.value.isEmpty)
                          const Text(
                            'Please select an image',
                            style: TextStyle(fontSize: 18),
                          ),
                        if (coverController.file.value.isNotEmpty)
                          Image.memory(
                            coverController.file.value,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.file_upload),
                          label: const Text("Select Image"),
                          onPressed: () async {
                            await coverFilePick();
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
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton.icon(
                  icon: const Icon(Icons.navigate_next),
                  label: const Text("Next Page"),
                  onPressed: coverController.file.value.isEmpty
                      ? null
                      : toPolyGraphyPage,
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
}
