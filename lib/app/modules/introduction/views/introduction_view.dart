import 'package:flutter/material.dart';
import 'package:flutterget/app/constant/color.dart';
import 'package:flutterget/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quran-Evolution",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Buang malasmu, bersuci dan ambil Al-Qur'an mu. Duduklah dan bacalah Al-Qur'an walau hanya satu ayat saja",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 300,
              child: Lottie.asset(
                Get.isDarkMode
                    ? "assets/lottie/dark.json"
                    : "assets/lottie/animasi.json",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  color: Get.isDarkMode ? appPurple : Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Get.isDarkMode ? Colors.white : appPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
