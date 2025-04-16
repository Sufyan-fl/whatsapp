// lib/app/routes/app_pages.dart

import 'package:get/get.dart';

import '../modules/calls/calls_controller.dart';
import '../modules/calls/calls_view.dart';
import '../modules/chat_details/chat_detail_controller.dart';
import '../modules/chat_details/chat_detail_view.dart';
import '../modules/desktop/desktop_layout_view.dart';
import '../modules/chats/chats_view.dart';

import '../modules/chats/chats_controller.dart';

import '../modules/profile/profile_view.dart';
import '../modules/status/status_controller.dart';
import '../modules/status/status_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () =>   DesktopLayoutView(),
    ),
    GetPage(
      name: AppRoutes.chats,
      page: () => const ChatsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ChatsController());
      }),
    ),
    GetPage(
      name: AppRoutes.chatDetail,
      page: () => const ChatDetailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ChatDetailController());
      }),
    ),
    GetPage(
      name: AppRoutes.status,
      page: () => const StatusView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => StatusController());
      }),
    ),
    GetPage(
      name: AppRoutes.calls,
      page: () => const CallsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CallsController());
      }),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
    ),
  ];
}
