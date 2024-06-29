import 'dart:io' show File;
import 'dart:typed_data';
import 'package:archive/archive.dart';

Future<Uint8List?> compressFiles(List<File> files) async {
  final encoder = ZipEncoder();
  final archive = Archive();

  for (var file in files) {
    final Uint8List bytes = await file.readAsBytes();
    final archiveFile = ArchiveFile(file.path
        .split('/')
        .last, bytes.length, bytes);
    archive.addFile(archiveFile);
  }
  final List<int>? zipData = encoder.encode(archive);

  if (zipData != null) {
    return Uint8List.fromList(zipData);
  } else {
    return null;
  }
}