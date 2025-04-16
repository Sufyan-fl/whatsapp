import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'layout_controller.dart';
import 'navigation_controller.dart';

class SidebarIcons extends StatelessWidget {
  final bool expanded;
  const SidebarIcons({super.key, this.expanded = false});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();

    return SizedBox(
      width: expanded ? 240 : 60, // ✅ enough space
      child: Container(
        color: const Color(0xFF1F2C34),
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 12),

            // Menu Icon
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.menu, size: 20, color: Colors.white70),
                tooltip: "Navigation",
                onPressed: () => Get.find<NavigationController>().toggle(),
              ),
            ),

            const SizedBox(height: 8),

            // TOP Section
            _sidebarIcon(
                Icons.chat, PanelView.chats, layout, "Chats", expanded),
            _sidebarIcon(
                Icons.call, PanelView.calls, layout, "Calls", expanded),
            _sidebarIcon(Icons.radio_button_checked, PanelView.status, layout,
                "Status", expanded),
            _sidebarIcon(Icons.bolt, null, layout, "Meta AI", expanded),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(color: Colors.white24, height: 1),
            ),

            // Push bottom section down
            const Spacer(),

            // BOTTOM Section
            _sidebarIcon(
                Icons.lock_outline, null, layout, "Locked chats", expanded),
            _sidebarIcon(Icons.star_border, null, layout, "Starred", expanded),
            _sidebarIcon(
                Icons.archive_outlined, null, layout, "Archived", expanded),
            _sidebarIcon(Icons.settings, null, layout, "Settings", expanded),

            const SizedBox(height: 12),

            if (expanded)
              Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/150?img=11"),
                    ),
                    SizedBox(width: 12),
                    Text("Your Name", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage:
                      NetworkImage("https://i.pravatar.cc/150?img=11"),
                ),
              ),
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
    bool expanded,
  ) {
    final isSelectable = view != null;

    return Tooltip(
      message: tooltip,
      verticalOffset: -40,
      child: InkWell(
        onTap: () {
          if (isSelectable) {
            layout.switchView(view);
            Get.find<NavigationController>().close();
          }
        },
        child: isSelectable
            ? Obx(() {
                final isSelected = layout.selectedView.value == view;
                return _buildIconRow(icon, tooltip, isSelected, expanded);
              })
            : _buildIconRow(icon, tooltip, false, expanded), // No Obx
      ),
    );
  }
}

Widget _buildIconRow(
    IconData icon, String tooltip, bool selected, bool expanded) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
    decoration: BoxDecoration(
      color: selected ? Colors.white10 : Colors.transparent,
      border: selected
          ? const Border(
              left: BorderSide(color: Color(0xFF00A884), width: 3),
            )
          : null,
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        if (expanded) ...[
          const SizedBox(width: 12),
          Flexible(
            child: Text(tooltip, style: const TextStyle(color: Colors.white70)),
          ),
        ],
      ],
    ),
  );
}
