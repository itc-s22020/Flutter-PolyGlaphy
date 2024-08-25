import 'dart:typed_data';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:polygraphy/components/check_extension.dart';

class CoverController extends GetxController{
  final Rx<Uint8List> file = Uint8List(0).obs;
  final Rx<String> extension = "".obs;

  void setFile(Uint8List newData) => file.value = newData;
  void setExtension() => extension.value = checkExtensions(file.value) ?? "";
  Uint8List getFile() => file.value;
  String getExtension() => extension.value;
}