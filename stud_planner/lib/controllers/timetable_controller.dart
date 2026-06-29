import 'package:get/get.dart';
import '../data/repositories/session_repository.dart';

class TimetableController extends GetxController {
  final SessionRepository repository = SessionRepository();
  final schedules = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadSchedules();
  }

  void loadSchedules() {
    schedules.assignAll(repository.getSchedules());
  }

  Future<void> deleteSchedule(int index) async {
    await repository.deleteSchedule(index);
    loadSchedules();
    Get.snackbar("Success", "Schedule Deleted", snackPosition: SnackPosition.BOTTOM);
  }
}
