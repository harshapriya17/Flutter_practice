import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/constants/hive_boxes.dart';

class HomeController extends GetxController {
  final settingsBox = Hive.box(HiveBoxes.settings).obs;
  final subjectsBox = Hive.box(HiveBoxes.subjects).obs;
  final tasksBox = Hive.box(HiveBoxes.tasks).obs;
  final sessionsBox = Hive.box(HiveBoxes.sessions).obs;

  String get userName => Hive.box(HiveBoxes.settings).get('userName', defaultValue: "");
  String? get profileImage => Hive.box(HiveBoxes.settings).get('profileImage');
  
  int get subjectCount => Hive.box(HiveBoxes.subjects).length;
  int get taskCount => Hive.box(HiveBoxes.tasks).length;
  int get sessionCount => Hive.box(HiveBoxes.sessions).length;

  @override
  void onInit() {
    super.onInit();
    // Listen to box changes to trigger UI updates
    Hive.box(HiveBoxes.settings).listenable().addListener(update);
    Hive.box(HiveBoxes.subjects).listenable().addListener(update);
    Hive.box(HiveBoxes.tasks).listenable().addListener(update);
    Hive.box(HiveBoxes.sessions).listenable().addListener(update);
  }

  @override
  void onClose() {
    Hive.box(HiveBoxes.settings).listenable().removeListener(update);
    Hive.box(HiveBoxes.subjects).listenable().removeListener(update);
    Hive.box(HiveBoxes.tasks).listenable().removeListener(update);
    Hive.box(HiveBoxes.sessions).listenable().removeListener(update);
    super.onClose();
  }
}
