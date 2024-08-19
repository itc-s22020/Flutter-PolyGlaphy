import 'package:get/get.dart';
import '../pages/home.dart';
import '../pages/polygraphy.dart';
import '../pages/result.dart';

void toPolyGraphyPage() {
  Get.to(() => const PolyGraphy(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 300));
}

void toResultPage() {
  Get.to(() => const Result(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 300));
}

void toHomePage() {
  Get.to(() => const Home(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 300));
}

void toOffHomePage() {
  Get.offAll(() => const Home(), transition: Transition.leftToRight, duration: const Duration(milliseconds: 300));
}

void toBackPage() {
  Get.back();
}
