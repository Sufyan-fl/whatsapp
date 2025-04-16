import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/chat_tile.dart';
import '../../data/dummy_data.dart';
import 'chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return ChatTile(
          name: chat['name']!,
          message: chat['lastMessage']!,
          time: chat['time']!,
          avatarUrl: chat['avatarUrl']!,
          onTap: () {
            // handle tap
          },
        );
      },
    );
  }
}
