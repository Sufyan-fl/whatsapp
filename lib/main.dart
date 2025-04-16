// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/layouts/layout_controller.dart';
import 'app/modules/layouts/navigation_controller.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

void main() {
  Get.put(LayoutController());
  Get.put(NavigationController());
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WhatsApp UI Clone',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeController.themeMode.value, // THIS .value is important
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        ));
  }
}
