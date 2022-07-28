import 'package:flutter/material.dart';
import 'package:flutterget/app/constant/color.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().LightTheme,
      darkTheme: Themes().DarkTheme,
      // themeMode: ThemeService().getThemeMode(),
      title: "Application",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
    ),
  );
}
