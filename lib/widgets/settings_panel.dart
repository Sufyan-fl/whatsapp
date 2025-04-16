import 'package:flutter/material.dart';

class SettingsPanel extends StatefulWidget {
  const SettingsPanel({super.key});

  @override
  State<SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  String selectedTab = "General";

  final List<String> tabs = [
    "General",
    "Account",
    "Chats",
    "Video & voice",
    "Notifications",
    "Personalization",
    "Storage",
    "Shortcuts",
    "Help",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomLeft,
      backgroundColor: const Color(0xFF202C33),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 700,
        height: 500,
        child: Row(
          children: [
            // Sidebar
            Container(
              width: 220,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey, width: 0.2),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      children: [
                        for (final tab in tabs)
                          ListTile(
                            leading: Icon(_getIcon(tab), color: Colors.white70),
                            title: Text(
                              tab,
                              style: TextStyle(
                                color: selectedTab == tab
                                    ? Colors.white
                                    : Colors.white54,
                                fontWeight: selectedTab == tab
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            selected: selectedTab == tab,
                            selectedTileColor: Colors.white10,
                            onTap: () => setState(() => selectedTab = tab),
                          ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Right Panel Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _buildSettingsContent(selectedTab),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsContent(String tab) {
    if (tab != "General") {
      return Center(
        child: Text("$tab settings coming soon...",
            style: TextStyle(color: Colors.grey[400])),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("General",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text("Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Start WhatsApp at login",
                style: TextStyle(color: Colors.white)),
            Switch(value: false, onChanged: null),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Language",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF2A3942),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButton<String>(
            value: "System default",
            dropdownColor: const Color(0xFF2A3942),
            iconEnabledColor: Colors.white70,
            underline: const SizedBox.shrink(),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: "System default",
                child: Text("System default",
                    style: TextStyle(color: Colors.white)),
              ),
              DropdownMenuItem(
                value: "English",
                child: Text("English", style: TextStyle(color: Colors.white)),
              ),
            ],
            onChanged: (_) {},
          ),
        ),
        const SizedBox(height: 24),
        const Text("Typing",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text(
          "Change typing settings for autocorrect and misspelled highlight from Windows Settings.",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Replace text with emoji",
                style: TextStyle(color: Colors.white)),
            Switch(value: true, onChanged: null),
          ],
        ),
      ],
    );
  }

  IconData _getIcon(String tab) {
    switch (tab) {
      case "Account":
        return Icons.person;
      case "Chats":
        return Icons.chat;
      case "Video & voice":
        return Icons.videocam;
      case "Notifications":
        return Icons.notifications;
      case "Personalization":
        return Icons.palette;
      case "Storage":
        return Icons.storage;
      case "Shortcuts":
        return Icons.keyboard;
      case "Help":
        return Icons.help_outline;
      default:
        return Icons.settings;
    }
  }
}
