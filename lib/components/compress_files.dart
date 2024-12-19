import 'dart:typed_data';
import 'package:archive/archive.dart';

Future<Uint8List?> compressFiles(List<Map<String, dynamic>> files) async {
  if (files.length == 1 && files[0]['name'].endsWith('.zip')) {
    return files[0]['data'] as Uint8List?;
  }

  final encoder = ZipEncoder();
  final archive = Archive();

  for (var file in files) {
    final String fileName = file['name'];
    final Uint8List bytes = file['data'];
    final archiveFile = ArchiveFile(fileName, bytes.length, bytes);
    archive.addFile(archiveFile);
  }

  final List<int>? zipData = encoder.encode(archive);

  if (zipData != null) {
    return Uint8List.fromList(zipData);
  } else {
    return null;
  }
}