import 'package:flutter/material.dart';
import 'package:flutterget/app/constant/color.dart';
import 'package:flutterget/app/data/models/juz.dart' as juz;
import 'package:flutterget/app/data/models/surah.dart';
import 'package:flutterget/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Quran Evo'),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () => Get.toNamed(Routes.SEARCH),
      //       icon: Icon(Icons.search),
      //     ),
      //     // GetBuilder<ThemeController>(
      //     //   builder: (controller) => IconButton(
      //     //     icon: Icon(
      //     //       controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
      //     //     ),
      //     //     onPressed: () => controller.toggleDarkMode(),
      //     //   ),
      //     // ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [appPurpleLight2, appPurpleDark]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      // onTap: () => Get.toNamed(Routes.LAST_READ),
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -40,
                              right: 0,
                              child: Opacity(
                                opacity: 0.6,
                                child: Container(
                                  width: 180,
                                  height: 180,
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.menu_book_rounded,
                                        color: appWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Terakhir dibaca",
                                        style: TextStyle(color: appWhite),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Al-Fatihah",
                                    style: TextStyle(color: appWhite),
                                  ),
                                  Text(
                                    "Juz 1 | Ayat 5",
                                    style: TextStyle(color: appWhite),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor:
                      controller.isDark.isTrue ? appWhite : appPurpleDark,
                  tabs: [
                    Tab(
                      text: "Surah",
                    ),
                    Tab(
                      text: "Juz",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      FutureBuilder<List<Surah>>(
                          future: controller.getAllSurah(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (!snapshot.hasData) {
                              return Center(
                                child: Text("tidak ada data"),
                              );
                            }
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Surah surah = snapshot.data![index];
                                return ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_SURAH,
                                        arguments: surah);
                                  },
                                  leading: Obx(
                                    () => Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(controller
                                                  .isDark.isTrue
                                              ? "assets/images/list_dark.png"
                                              : "assets/images/list.png"),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${surah.number}",
                                          style: TextStyle(
                                              color: controller.isDark.isTrue
                                                  ? appWhite
                                                  : appPurpleDark),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Obx(
                                    () => Text(
                                      "${surah.name?.transliteration?.id ?? 'Error..'}",
                                      style: TextStyle(
                                          color: controller.isDark.isTrue
                                              ? appWhite
                                              : appPurpleDark),
                                    ),
                                  ),
                                  subtitle: Text(
                                      "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error..'}"),
                                  trailing: Obx(
                                    () => Text(
                                      "${surah.name?.short ?? 'Error..'}",
                                      style: TextStyle(
                                          color: controller.isDark.isTrue
                                              ? appWhite
                                              : appPurpleDark),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                      FutureBuilder<List<juz.Juz>>(
                        future: controller.getAllJuz(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text("tidak ada data"),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              juz.Juz detailJuz = snapshot.data![index];

                              String nameStart =
                                  detailJuz.juzStartInfo?.split(" - ").first ??
                                      "";
                              String nameEnd =
                                  detailJuz.juzEndInfo?.split(" - ").first ??
                                      "";

                              List<Surah> allSurahInJuz = [];
                              List<Surah> rawAllSurahInJuz = [];

                              for (Surah item in controller.allSurah) {
                                rawAllSurahInJuz.add(item);
                                if (item.name!.transliteration?.id == nameEnd) {
                                  break;
                                }
                              }

                              for (Surah item
                                  in rawAllSurahInJuz.reversed.toList()) {
                                allSurahInJuz.add(item);
                                if (item.name!.transliteration?.id ==
                                    nameStart) {
                                  break;
                                }
                              }

                              return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_JUZ, arguments: {
                                    "juz": detailJuz,
                                    "surah": allSurahInJuz.reversed.toList()
                                  });
                                },
                                leading: Obx(
                                  () => Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          controller.isDark.isTrue
                                              ? "assets/images/list_dark.png"
                                              : "assets/images/list.png",
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            color: controller.isDark.isTrue
                                                ? appWhite
                                                : appPurpleDark),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Obx(
                                  () => Text(
                                    "Juz ${index + 1}",
                                    style: TextStyle(
                                        color: controller.isDark.isTrue
                                            ? appWhite
                                            : appPurpleDark),
                                  ),
                                ),
                                isThreeLine: true,
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Mulai dari ${detailJuz.juzStartInfo}",
                                    ),
                                    Text(
                                      "Sampai ${detailJuz.juzEndInfo}",
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeThemeMode(
              controller.isDark.isTrue ? ThemeMode.light : ThemeMode.dark);
          controller.isDark.toggle();
        },
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
