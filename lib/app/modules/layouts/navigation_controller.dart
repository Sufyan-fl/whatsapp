import 'package:get/get.dart';

class NavigationController extends GetxController {
  final isExpanded = false.obs;

  void toggle() => isExpanded.value = !isExpanded.value;
  void close() => isExpanded.value = false;
}
