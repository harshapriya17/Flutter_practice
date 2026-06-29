import 'package:get/get.dart';

class Team {
  final String id;
  final String name;
  final int membersCount;
  final String role;

  Team({required this.id, required this.name, required this.membersCount, required this.role});
}

class TeamsController extends GetxController {
  final teams = <Team>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  void fetchTeams() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    teams.assignAll([
      Team(id: '1', name: 'Alpha Squad', membersCount: 5, role: 'Lead'),
      Team(id: '2', name: 'Design Gurus', membersCount: 3, role: 'Member'),
    ]);
    isLoading.value = false;
  }
}
