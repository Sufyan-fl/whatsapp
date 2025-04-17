import 'package:flutter/material.dart';

class SettingsPanel extends StatefulWidget {
  final String initialTab;
  const SettingsPanel({super.key, this.initialTab = "General"});
  @override
  State<SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  late String selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
  }

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
    "Profile", // ✅ Add this as last tab
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
    if (tab == "General") {
      return const Text("General settings go here",
          style: TextStyle(color: Colors.white));
    }

    if (tab == "Profile") {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(
                "https://media.istockphoto.com/id/916306960/photo/faceless-man-in-hoodie-standing-isolated-on-black.jpg?s=612x612&w=0&k=20&c=pMeGd1UuJgvdZ2gV2VQC2Jn3VwMNeW6TF3cG9RIo1tY=",
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Sufyan",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Icon(Icons.edit, size: 18, color: Colors.white54),
              ],
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "When you don't get the Miracle, be one.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(Icons.edit, size: 18, color: Colors.white54),
              ],
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone number",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "+92 334 6264573",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Divider(height: 30, color: Colors.grey),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child:
                  const Text("Log out", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 12),
            const Text(
              "Chat history on this computer will be cleared when you log out.",
              style: TextStyle(color: Colors.white54, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Add logic for other tabs if needed
    return Text("$tab settings go here",
        style: const TextStyle(color: Colors.white));
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
      case "Profile":
        return Icons.person;
      default:
        return Icons.settings;
    }
  }
}
