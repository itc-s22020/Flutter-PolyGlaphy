import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:polygraphy/components/compress_files.dart';
import 'package:polygraphy/getX/data_controller.dart';
import '../getX/cover_controller.dart';

Future<void> coverFilePick() async {
  final CoverController c = Get.put(CoverController());
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    withData: true,
    type: FileType.custom,
    allowedExtensions: ['jpg','png']
  );
  if (result != null && result.files.isNotEmpty) {
    final PlatformFile file = result.files.first;
    if (kIsWeb) { c.setFile(file.bytes!); } else {
      c.setFile(await File(file.path!).readAsBytes());
    }
  }
}

Future<void> filePick() async {
  final DataController c = Get.put(DataController());
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true
  );
  if (result != null && result.files.isNotEmpty) {
    List<File> files = result.paths.map((path) => File(path!)).toList();
    Uint8List? zipData = await compressFiles(files);
    if (zipData != null) {
      c.setFile(zipData);
    }
  }
}