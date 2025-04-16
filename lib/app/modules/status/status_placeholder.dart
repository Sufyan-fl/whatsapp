import 'package:flutter/material.dart';

class StatusPlaceholder extends StatelessWidget {
  const StatusPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Click on a contact to view their status updates",
              style: TextStyle(color: Colors.white60),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "🔒 Status updates are end-to-end encrypted",
              style: TextStyle(color: Colors.white30, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
