import 'dart:typed_data';

Map<List<int>, String> fileSignatures = {
  [0xFF, 0xD8, 0xFF]: 'jpg',
  [0x89, 0x50, 0x4E, 0x47]: 'png',
  [0x47, 0x49, 0x46]: 'gif',
  [0x25, 0x50, 0x44, 0x46]: 'pdf',
  [0x50, 0x4B, 0x03, 0x04]: 'zip',
};

String? checkExtensions(Uint8List bytes) {
  if (bytes.length < 4) return null;

  for (var entry in fileSignatures.entries) {
    if (bytes.length >= entry.key.length &&
        entry.key.asMap().entries.every((e) => bytes[e.key] == e.value)) {
      return entry.value;
    }
  }

  return null;
}