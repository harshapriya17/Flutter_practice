import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/constants/hive_boxes.dart';

class AnalyticsController extends GetxController {
  final tasksBox = Hive.box(HiveBoxes.tasks);
  final sessionsBox = Hive.box(HiveBoxes.sessions);

  int get completedTasks => tasksBox.values.where((task) => task['completed'] == true).length;
  int get totalSessions => sessionsBox.length;

  Map<String, int> get subjectTaskCount {
    Map<String, int> counts = {};
    for (var task in tasksBox.values) {
      String subject = task['subject'] ?? 'Unknown';
      counts[subject] = (counts[subject] ?? 0) + 1;
    }
    return counts;
  }

  @override
  void onInit() {
    super.onInit();
    tasksBox.listenable().addListener(update);
    sessionsBox.listenable().addListener(update);
  }

  @override
  void onClose() {
    tasksBox.listenable().removeListener(update);
    sessionsBox.listenable().removeListener(update);
    super.onClose();
  }
}
