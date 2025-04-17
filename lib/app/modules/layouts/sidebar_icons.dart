import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/coming_soon.dart';
import '../../../widgets/settings_panel.dart';
import 'layout_controller.dart';
import 'navigation_controller.dart';

class SidebarIcons extends StatelessWidget {
  final bool expanded;
  const SidebarIcons({super.key, this.expanded = false});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();

    return SizedBox(
      width: expanded ? 240 : 50, // ✅ enough space
      child: Container(
        color: const Color(0xFF1F2C34),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 12),

                // Menu Icon
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.menu,
                          size: 15, color: Colors.white70),
                      tooltip: "Navigation",
                      onPressed: () =>
                          Get.find<NavigationController>().toggle(),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // TOP Section
                _sidebarIcon(
                    Icons.chat, PanelView.chats, layout, "Chats", expanded),
                _sidebarIcon(
                    Icons.call, PanelView.calls, layout, "Calls", expanded),
                _sidebarIcon(Icons.radio_button_checked, PanelView.status,
                    layout, "Status", expanded),
                _sidebarIcon(Icons.bolt, null, layout, "Meta AI", expanded),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(color: Colors.white24, height: 1),
                ),
              ],
            ),
            Column(
              children: [
                // BOTTOM Section
                _sidebarIcon(
                    Icons.lock_outline, null, layout, "Locked chats", expanded,
                    comingSoon: true),
                _sidebarIcon(
                    Icons.star_border, null, layout, "Starred", expanded,
                    comingSoon: true),
                _sidebarIcon(
                    Icons.archive_outlined, null, layout, "Archived", expanded,
                    comingSoon: true),

                _sidebarIcon(
                  Icons.settings,
                  null,
                  layout,
                  "Settings",
                  expanded,
                  onTapOverride: () {
                    Get.dialog(const SettingsPanel(), barrierDismissible: true);
                  },
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        const SettingsPanel(
                            initialTab: "Profile"), // ✅ opens on Profile
                        barrierDismissible: true,
                      );
                    },
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/id/916306960/photo/faceless-man-in-hoodie-standing-isolated-on-black.jpg?s=612x612&w=0&k=20&c=pMeGd1UuJgvdZ2gV2VQC2Jn3VwMNeW6TF3cG9RIo1tY=",
                          scale: 1.0),
                    ),
                  ),
                ),
              ],
            )
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
    bool expanded, {
    bool comingSoon = false,
    VoidCallback? onTapOverride,
  }) {
    return Tooltip(
      message: tooltip,
      verticalOffset: -50,
      child: InkWell(
        onTap: () {
          if (onTapOverride != null) {
            onTapOverride();
          } else if (view != null) {
            layout.switchView(view);
          } else if (comingSoon) {
            Get.dialog(
              Dialog(
                child: ComingSoon(title: tooltip),
              ),
            );
          }
          Get.find<NavigationController>().close();
        },
        child: view != null
            ? Obx(() {
                final isSelected = layout.selectedView.value == view;
                return _buildIconRow(icon, tooltip, isSelected, expanded);
              })
            : _buildIconRow(icon, tooltip, false, expanded),
      ),
    );
  }
}

Widget _buildIconRow(
    IconData icon, String tooltip, bool selected, bool expanded) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
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
        Icon(icon, color: Colors.white70, size: 15),
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
