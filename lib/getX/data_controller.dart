import 'dart:typed_data';
import 'package:get/get.dart';

class DataController extends GetxController {
  final Rx<Uint8List> file = Uint8List(0).obs;
  final RxString fileName = ''.obs;

  void setFile(Uint8List newData) => file.value = newData;
  void setFileName(String name) => fileName.value = name;
  Uint8List getFile() => file.value;
  String getFileName() => fileName.value;
}