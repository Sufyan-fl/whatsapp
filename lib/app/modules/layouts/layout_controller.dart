import 'package:get/get.dart';

enum PanelView { chats, calls, status }

class LayoutController extends GetxController {
  final selectedView = PanelView.chats.obs;

  void switchView(PanelView view) {
    selectedView.value = view;
  }
}
