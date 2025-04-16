import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../chats/chats_view.dart';
import '../status/status_view.dart';
import '../calls/calls_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 12),
            const Icon(Icons.more_vert),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Get.toNamed(AppRoutes.profile),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            ChatsView(),
            StatusView(),
            CallsView(),
          ],
        ),
      ),
    );
  }
}
