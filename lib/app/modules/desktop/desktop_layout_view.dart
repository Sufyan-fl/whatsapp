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

class DesktopLayoutView extends StatefulWidget {
  const DesktopLayoutView({super.key});

  @override
  State<DesktopLayoutView> createState() => _DesktopLayoutViewState();
}

class _DesktopLayoutViewState extends State<DesktopLayoutView> {
  double middlePanelWidth = 320;

  @override
  Widget build(BuildContext context) {
    final layout = Get.find<LayoutController>();
    final nav = Get.find<NavigationController>();

    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      body: Stack(
        children: [
          Row(
            children: [
              // Sidebar
              const SidebarIcons(),

              // Middle Panel (Resizable)
              SizedBox(
                width: middlePanelWidth,
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

              // Drag Handle
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    middlePanelWidth += details.delta.dx;
                    if (middlePanelWidth < 220) middlePanelWidth = 220;
                    if (middlePanelWidth > 500) middlePanelWidth = 500;
                  });
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  child: Container(
                    width: 4,
                    color: Colors.grey[700],
                  ),
                ),
              ),

              // Right Panel
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

          // Overlay Sidebar (Expanded)
          Obx(() {
            return nav.isExpanded.value
                ? Stack(
                    children: [
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: nav.close,
                          behavior: HitTestBehavior.translucent,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: 240,
                          child: SidebarIcons(expanded: true),
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
