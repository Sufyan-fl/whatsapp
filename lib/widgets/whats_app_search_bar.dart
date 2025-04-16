import 'package:flutter/material.dart';

class WhatsAppSearchBar extends StatelessWidget {
  const WhatsAppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF202C33),
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          bottom: BorderSide(color: Color(0xFF00A884), width: 2),
        ),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: "Search or start a new chat",
          hintStyle: TextStyle(color: Color(0xFF8696A0)),
          prefixIcon: Icon(Icons.search, size: 18, color: Color(0xFF8696A0)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          isCollapsed: true,
        ),
      ),
    );
  }
}
