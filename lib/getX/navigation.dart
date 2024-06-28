import 'dart:typed_data';

import 'package:get/get.dart';
import '../pages/home.dart';
import '../pages/polygraphy.dart';
import '../pages/result.dart';
import 'file_controller.dart';

void toPolyGraphyPage() {
  Get.to(const PolyGraphy());
}

void toResultPage() {
  Get.to(const Result());
}

void toHomePage() {
  Get.to(const Home());
}

void toOffHomePage() {
  Get.offAll(const Home());
}

void toBackPage() {
  Get.back();
}
