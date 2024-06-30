import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
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
