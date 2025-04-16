import 'package:flutter/material.dart';
import '../../models/call_model.dart';
import '../../models/dummy_calls.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text("Favorites",
              style: TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title:
              const Text("Add favorite", style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
        const Divider(color: Colors.white12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text("Recent",
              style: TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        ...dummyCallLogs.map((call) => _callTile(call)).toList(),
      ],
    );
  }

  Widget _callTile(CallModel call) {
    IconData icon = Icons.phone;
    Color color = Colors.white70;

    switch (call.type) {
      case CallType.incoming:
        icon = Icons.call_received_outlined;
        color = Colors.white70;
        break;
      case CallType.outgoing:
        icon = Icons.call_made_outlined;
        color = Colors.white70;
        break;
      case CallType.missed:
        icon = Icons.call_missed_outlined;
        color = Colors.redAccent;
        break;
    }

    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(call.avatarUrl)),
      title: Text(call.name, style: const TextStyle(color: Colors.white)),
      subtitle: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(call.subtitle, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
      trailing: Text(call.time,
          style: const TextStyle(color: Colors.white54, fontSize: 12)),
    );
  }
}
