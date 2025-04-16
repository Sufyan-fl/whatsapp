import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/tab_header_bar.dart';
import '../../../widgets/whats_app_search_bar.dart';
import '../calls/call_actions_placeholder.dart';
import '../calls/calls_view.dart';
import '../chats/chats_view.dart';
import '../layouts/layout_controller.dart';
import '../layouts/navigation_controller.dart';
import '../layouts/sidebar_icons.dart';
import '../status/status_placeholder.dart';
import '../status/status_view.dart';
import 'chat_placeholder.dart';

class DesktopLayoutView extends StatelessWidget {
  const DesktopLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();
    final nav = Get.find<NavigationController>();

    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      body: Stack(
        children: [
          // Main layout row
          Row(
            children: [
              SidebarIcons(), // small sidebar always visible

              SizedBox(
                width: 320,
                child: ColoredBox(
                  color: const Color(0xFF121B22),
                  child: Column(
                    children: [
                      const TopTabHeader(),
                      const WhatsAppSearchBar(),
                      Expanded(
                        child: Obx(() {
                          final view = layout.selectedView.value;
                          return switch (view) {
                            PanelView.calls => const CallsView(),
                            PanelView.status => const StatusView(),
                            _ => const ChatsView(),
                          };
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              const VerticalDivider(width: 1, color: Colors.grey),

              Expanded(
                child: Obx(() {
                  final view = layout.selectedView.value;
                  return switch (view) {
                    PanelView.calls => const CallActionsPlaceholder(),
                    PanelView.status => const StatusPlaceholder(),
                    _ => const ChatPlaceholder(),
                  };
                }),
              ),
            ],
          ),

          // ✅ Expanded Sidebar Overlay
          Obx(() {
            print("📡 Expanded sidebar visible: ${nav.isExpanded.value}");
            return nav.isExpanded.value
                ? Stack(
                    children: [
                      // Click-outside-to-close layer
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: nav.close,
                          behavior: HitTestBehavior.translucent,
                        ),
                      ),

                      // Overlay sidebar on top of everything
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: 240,
                          child: SidebarIcons(
                            expanded: true,
                          ), // full width sidebar
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
