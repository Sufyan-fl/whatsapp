import 'package:flutter/material.dart';

class CallTile extends StatelessWidget {
  final Map<String, String> call;

  const CallTile({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    final isVideo = call['type'] == 'video';

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(call['avatarUrl']!),
      ),
      title: Text(call['name']!),
      subtitle: Row(
        children: [
          Icon(
            call['status'] == 'missed'
                ? Icons.call_missed
                : call['status'] == 'outgoing'
                    ? Icons.call_made
                    : Icons.call_received,
            size: 16,
            color: call['status'] == 'missed' ? Colors.red : Colors.green,
          ),
          const SizedBox(width: 4),
          Text(call['time']!),
        ],
      ),
      trailing:
          Icon(isVideo ? Icons.videocam : Icons.call, color: Colors.green),
      onTap: () {
        // Optionally, show call details or action
      },
    );
  }
}
