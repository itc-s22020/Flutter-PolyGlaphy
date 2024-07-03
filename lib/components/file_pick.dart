import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:polygraphy/components/compress_files.dart';
import 'package:polygraphy/getX/data_controller.dart';
import 'dart:typed_data';

Future<void> filePick() async {
  final DataController c = Get.put(DataController());

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    withData: true,
  );

  if (result != null && result.files.isNotEmpty) {
    List<Map<String, dynamic>> files = result.files.map((file) => {
      'name': file.name,
      'data': file.bytes!,
    }).toList();

    Uint8List? zipData = await compressFiles(files);
    if (zipData != null) {
      c.setFile(zipData);
    }
  }
}