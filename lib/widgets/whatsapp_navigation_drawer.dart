import 'package:flutter/material.dart';

class WhatsAppNavigationDrawer extends StatelessWidget {
  const WhatsAppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF111B21),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTile(Icons.chat_bubble_outline, "Chats"),
            buildTile(Icons.call_outlined, "Calls"),
            buildTile(Icons.circle_outlined, "Status", badge: true),
            buildTile(Icons.blur_circular, "Meta AI",
                color: Colors.purpleAccent),
            const Divider(color: Colors.white12),
            buildTile(Icons.lock_outline, "Locked chats"),
            buildTile(Icons.star_border, "Starred messages"),
            buildTile(Icons.archive_outlined, "Archived chats", badgeText: "3"),
            const Spacer(),
            buildTile(Icons.settings, "Settings"),
            buildTile(Icons.person, "Profile",
                avatarUrl: "https://i.pravatar.cc/150?img=11"),
          ],
        ),
      ),
    );
  }

  Widget buildTile(IconData icon, String title,
      {bool badge = false,
      String? badgeText,
      Color? color,
      String? avatarUrl}) {
    return ListTile(
      leading: avatarUrl != null
          ? CircleAvatar(radius: 14, backgroundImage: NetworkImage(avatarUrl))
          : Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, color: color ?? Colors.white70, size: 20),
                if (badge)
                  const Positioned(
                    top: -2,
                    right: -2,
                    child:
                        CircleAvatar(radius: 3, backgroundColor: Colors.green),
                  ),
              ],
            ),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 14)),
      trailing: badgeText != null
          ? CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Text(badgeText,
                  style: const TextStyle(color: Colors.white, fontSize: 10)),
            )
          : null,
      onTap: () {
        // handle navigation state change
      },
    );
  }
}
