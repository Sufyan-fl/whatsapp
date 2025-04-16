import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final Map<String, String> status;

  const StatusTile(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(status['avatarUrl']!),
        radius: 25,
      ),
      title: Text(status['name']!),
      subtitle: Text(status['time']!),
      onTap: () {
        // Optional: Navigate to story view
      },
    );
  }
}
