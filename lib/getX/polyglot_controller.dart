import 'dart:typed_data';
import 'package:get/get.dart';

class PolyglotController extends GetxController{
  final Rx<Uint8List> file = Uint8List(0).obs;

  void setFile(Uint8List newData) => file.value = newData;
  Uint8List getFile() => file.value;
}