import 'package:get/get.dart';
import '../../data/services/auth_service.dart';

class DashboardController extends GetxController {
  final AuthService _authService;

  final selectedIndex = 0.obs;
  
  // Dashboard stats
  final projectsCount = 12.obs;
  final teamsCount = 5.obs;
  final tasksCount = 8.obs;

  DashboardController(this._authService);

  String get userName => _authService.user?.name ?? 'Student';

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void logout() async {
    await _authService.clearUser();
    Get.offAllNamed('/login');
  }
}
