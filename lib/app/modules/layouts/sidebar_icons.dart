import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'layout_controller.dart';

class SidebarIcons extends StatelessWidget {
  const SidebarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();

    return SizedBox(
      width: 60,
      child: Container(
        color: const Color(0xFF1F2C34),
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: IconButton(
                icon: const Icon(Icons.menu, size: 20, color: Colors.white70),
                tooltip: "Navigation",
                onPressed: () {
                  // Optional: If you want to implement expandable menu in future
                  // You can just leave this empty for now
                },
              ),
            ),

            const SizedBox(height: 16),

            // Top Section
            _sidebarIcon(Icons.chat, PanelView.chats, layout, "Chats"),
            _sidebarIcon(Icons.call, PanelView.calls, layout, "Calls"),
            _sidebarIcon(
                Icons.radio_button_checked, PanelView.status, layout, "Status"),
            _sidebarIcon(Icons.bolt, null, layout, "Meta AI"),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(color: Colors.white24, height: 1),
            ),

            // Spacer to push these to bottom
            const Spacer(),

            // Bottom Section
            _sidebarIcon(Icons.lock_outline, null, layout, "Locked chats"),
            _sidebarIcon(Icons.star_border, null, layout, "Starred"),
            _sidebarIcon(Icons.archive_outlined, null, layout, "Archived"),
            _sidebarIcon(Icons.settings, null, layout, "Settings"),

            const SizedBox(height: 8),

            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _sidebarIcon(
    IconData icon,
    PanelView? view,
    LayoutController layout,
    String tooltip,
  ) {
    return Tooltip(
      message: tooltip,
      verticalOffset: -40,
      child: InkWell(
        onTap: () {
          if (view != null) layout.switchView(view);
        },
        child: view != null
            ? Obx(() {
                final isSelected = layout.selectedView.value == view;

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white10 : Colors.transparent,
                    border: isSelected
                        ? const Border(
                            left:
                                BorderSide(color: Color(0xFF00A884), width: 3),
                          )
                        : null,
                  ),
                  child: Icon(icon, color: Colors.white70, size: 20),
                );
              })
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Icon(icon, color: Colors.white70, size: 20),
              ),
      ),
    );
  }
}
