import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/modules/layouts/layout_controller.dart';

class TopTabHeader extends StatelessWidget {
  const TopTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutController controller = Get.find();

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: const Color(0xFF202C33),
      child: Row(
        children: [
          // 📌 Tab Title
          Obx(() {
            final view = controller.selectedView.value;
            final String title = switch (view) {
              PanelView.calls => "Calls",
              PanelView.status => "Status",
              _ => "Chats"
            };
            return Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            );
          }),

          const Spacer(),

          // 🖊 New Chat Button
          IconButton(
            icon: const Icon(Icons.edit, size: 20, color: Colors.white70),
            onPressed: () {
              Get.snackbar("Action", "Start new chat tapped");
            },
          ),

          // 🧰 Filter Icon with Menu
          PopupMenuButton<String>(
            icon:
                const Icon(Icons.filter_list, color: Colors.white70, size: 20),
            color: const Color(0xFF2A2F32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onSelected: (value) {
              Get.snackbar("Filter", "Filter selected: $value");
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'header',
                enabled: false,
                child: Text("Filter chats by",
                    style: TextStyle(color: Colors.grey)),
              ),
              const PopupMenuItem<String>(
                value: 'unread',
                child: Row(children: [
                  Icon(Icons.mark_chat_unread_outlined,
                      size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("Unread", style: TextStyle(color: Colors.white)),
                ]),
              ),
              const PopupMenuItem<String>(
                value: 'favorites',
                child: Row(children: [
                  Icon(Icons.favorite_border, size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("Favorites", style: TextStyle(color: Colors.white)),
                ]),
              ),
              const PopupMenuItem<String>(
                value: 'contacts',
                child: Row(children: [
                  Icon(Icons.person_outline, size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("Contacts", style: TextStyle(color: Colors.white)),
                ]),
              ),
              const PopupMenuItem<String>(
                value: 'noncontacts',
                child: Row(children: [
                  Icon(Icons.person_off_outlined,
                      size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("Non-contacts", style: TextStyle(color: Colors.white)),
                ]),
              ),
              const PopupMenuItem<String>(
                value: 'groups',
                child: Row(children: [
                  Icon(Icons.groups_outlined, size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("Groups", style: TextStyle(color: Colors.white)),
                ]),
              ),
              const PopupMenuItem<String>(
                value: 'drafts',
                child: Row(children: [
                  Icon(Icons.edit_note_outlined,
                      size: 18, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("Drafts", style: TextStyle(color: Colors.white)),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
