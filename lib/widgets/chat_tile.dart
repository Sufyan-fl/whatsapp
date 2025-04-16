import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final VoidCallback onTap;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          message,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF8696A0),
          ),
        ),
        trailing: Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8696A0),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
