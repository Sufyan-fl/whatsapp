import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/theme_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
          ),
          const SizedBox(height: 16),
          const Center(child: Text("Sufyan", style: TextStyle(fontSize: 20))),
          const Divider(height: 32),

          // Theme toggle switch
          Obx(() => SwitchListTile(
                title: const Text("Dark Mode"),
                value: themeController.isDarkMode,
                onChanged: (val) => themeController.toggleTheme(),
                secondary: const Icon(Icons.dark_mode),
              )),
        ],
      ),
    );
  }
}
