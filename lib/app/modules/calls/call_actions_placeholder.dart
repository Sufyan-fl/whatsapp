import 'package:flutter/material.dart';

class CallActionsPlaceholder extends StatelessWidget {
  const CallActionsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _callActionButton(Icons.videocam_rounded, "Start call",
              primary: true),
          const SizedBox(width: 40),
          _callActionButton(Icons.video_call_outlined, "New call link"),
          const SizedBox(width: 40),
          _callActionButton(Icons.dialpad, "Call a number"),
        ],
      ),
    );
  }

  Widget _callActionButton(IconData icon, String label,
      {bool primary = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2F32),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon,
              size: 26, color: primary ? Color(0xFF00A884) : Colors.white70),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 13)),
      ],
    );
  }
}
