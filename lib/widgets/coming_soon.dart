import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String title;
  const ComingSoon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 64, color: Colors.grey[600]),
          const SizedBox(height: 16),
          Text(
            "$title\nComing Soon...",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400], fontSize: 18),
          ),
        ],
      ),
    );
  }
}
