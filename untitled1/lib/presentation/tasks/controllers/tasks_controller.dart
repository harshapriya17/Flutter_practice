import 'package:get/get.dart';
import '../../../data/models/task_model.dart';
import '../../../core/constants/mock_data.dart';

class TasksController extends GetxController {
  final tasks = <TaskModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    
    tasks.assignAll(MockData.tasks);
    
    isLoading.value = false;
  }
}
