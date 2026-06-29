import 'package:get/get.dart';
import '../../data/models/task_model.dart';

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
    
    tasks.assignAll([
      TaskModel(
        id: '1',
        title: 'Design UI/UX',
        description: 'Create high-fidelity wireframes',
        status: 'in_progress',
        projectId: '1',
        dueDate: DateTime.now().add(const Duration(days: 2)),
      ),
      TaskModel(
        id: '2',
        title: 'Setup Firebase',
        description: 'Initialize firebase project and auth',
        status: 'todo',
        projectId: '1',
        dueDate: DateTime.now().add(const Duration(days: 5)),
      ),
      TaskModel(
        id: '3',
        title: 'API Integration',
        description: 'Connect login and register endpoints',
        status: 'completed',
        projectId: '1',
      ),
    ]);
    
    isLoading.value = false;
  }
}
