import 'package:get/get.dart';
import '../data/repositories/task_repository.dart';

class TasksController extends GetxController {
  final TaskRepository repository = TaskRepository();
  final tasks = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll(repository.getTasks());
  }

  Future<void> deleteTask(int index) async {
    await repository.deleteTask(index);
    loadTasks();
    Get.snackbar("Success", "Task Deleted", snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> toggleTask(int index) async {
    final task = Map<String, dynamic>.from(tasks[index]);
    task["completed"] = !task["completed"];
    await repository.updateTask(index, task);
    loadTasks();
  }
}
