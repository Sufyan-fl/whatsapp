import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  final TextEditingController textController = TextEditingController();

  void sendMessage() {
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      messages.insert(0, {"text": text, "isMe": true});
      textController.clear();
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
