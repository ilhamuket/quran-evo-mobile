import 'package:get/get.dart';

import 'package:flutterget/app/modules/detail_juz/bindings/detail_juz_binding.dart';
import 'package:flutterget/app/modules/detail_juz/views/detail_juz_view.dart';
import 'package:flutterget/app/modules/detail_surah/bindings/detail_surah_binding.dart';
import 'package:flutterget/app/modules/detail_surah/views/detail_surah_view.dart';
import 'package:flutterget/app/modules/home/bindings/home_binding.dart';
import 'package:flutterget/app/modules/home/views/home_view.dart';
import 'package:flutterget/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:flutterget/app/modules/introduction/views/introduction_view.dart';
import 'package:flutterget/app/modules/last_read/bindings/last_read_binding.dart';
import 'package:flutterget/app/modules/last_read/views/last_read_view.dart';
import 'package:flutterget/app/modules/search/bindings/search_binding.dart';
import 'package:flutterget/app/modules/search/views/search_view.dart';
import 'package:flutterget/app/modules/theme/bindings/theme_binding.dart';
import 'package:flutterget/app/modules/theme/views/theme_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.LAST_READ,
      page: () => LastReadView(),
      binding: LastReadBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => ThemeView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_JUZ,
      page: () => DetailJuzView(),
      binding: DetailJuzBinding(),
    ),
  ];
}