import 'package:get/get.dart';
import '../presentation/tasks/tasks_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TasksController());
  }
}
