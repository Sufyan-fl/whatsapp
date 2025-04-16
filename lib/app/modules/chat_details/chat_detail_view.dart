import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/message_bubble.dart'; 
import 'chat_detail_controller.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final contactName = args['name'];
    final avatarUrl = args['avatarUrl'];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
            const SizedBox(width: 10),
            Text(contactName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(12),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  return MessageBubble(
                    message: msg['text'],
                    isMe: msg['isMe'],
                  );
                },
              );
            }),
          ),
          InputField(
            controller: controller.textController,
            onSend: controller.sendMessage,
          ),
        ],
      ),
    );
  }
}
