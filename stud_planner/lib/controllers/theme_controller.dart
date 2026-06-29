import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/constants/hive_boxes.dart';

class ThemeController extends GetxController {
  final _box = Hive.box(HiveBoxes.settings);
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _box.get('isDarkMode', defaultValue: false);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _box.put('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  ThemeMode get themeMode => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}
