import 'package:flutter/material.dart';
import '../../models/dummy_statuses.dart';
import '../../models/status_model.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text("My status",
              style: TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
          ),
          title: const Text("My status", style: TextStyle(color: Colors.white)),
          subtitle: const Text("No updates",
              style: TextStyle(color: Colors.white54, fontSize: 12)),
        ),
        const Divider(color: Colors.white12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text("Recent updates",
              style: TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        ...dummyStatuses.map((status) => _statusTile(status)).toList(),
      ],
    );
  }

  Widget _statusTile(StatusModel status) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF00A884), width: 2),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(status.avatarUrl),
          radius: 20,
        ),
      ),
      title: Text(status.name, style: const TextStyle(color: Colors.white)),
      subtitle: Text(status.time,
          style: const TextStyle(color: Colors.white54, fontSize: 12)),
    );
  }
}
