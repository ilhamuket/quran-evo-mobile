import 'package:flutter/material.dart';
import 'package:flutterget/app/constant/color.dart';
import 'package:flutterget/app/data/models/juz.dart' as juz;
import 'package:flutterget/app/data/models/surah.dart';

import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final juz.Juz detailJuz = Get.arguments["juz"];
  final List<Surah> allSurahInThisJuz = Get.arguments["surah"];
  @override
  Widget build(BuildContext context) {
    allSurahInThisJuz.forEach((element) {
      print(element.name!.transliteration!.id);
    });
    return Scaffold(
        body: ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: detailJuz.verses?.length ?? 0,
      itemBuilder: (context, index) {
        if (detailJuz.verses?.length == null || detailJuz.verses?.length == 0) {
          return Center(
            child: Text("Tidak Ada data"),
          );
        }
        juz.Verses ayat = detailJuz.verses![index];
        if (index != 0) {
          if (ayat.number?.inSurah == 1) {
            controller.index++;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appPurple.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              Get.isDarkMode
                                  ? "assets/images/list_dark.png"
                                  : "assets/images/list.png",
                            ),
                            fit: BoxFit.contain,
                          )),
                          child: Center(
                            child: Text("${ayat.number?.inSurah}"),
                          ),
                        ),
                        Text(
                          "${allSurahInThisJuz[controller.index].name?.transliteration?.id}",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_add_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${ayat.text?.arab}",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${ayat.text?.transliteration?.en}",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${ayat.translation?.id}",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        );
      },
    ));
  }
}
