import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeView extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThemeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ThemeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
