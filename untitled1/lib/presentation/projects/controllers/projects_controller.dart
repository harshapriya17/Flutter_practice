import 'package:get/get.dart';
import '../../../core/constants/mock_data.dart';

class Project {
  final String id;
  final String title;
  final String description;
  final double progress;
  final List<String> tags;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.tags,
  });
}

class ProjectsController extends GetxController {
  final projects = <Project>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    projects.assignAll(MockData.projects);
    
    isLoading.value = false;
  }
}
