import 'package:get/get.dart';
import '../data/repositories/subject_repository.dart';

class SubjectsController extends GetxController {
  final SubjectRepository repository = SubjectRepository();
  final subjects = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadSubjects();
  }

  void loadSubjects() {
    subjects.assignAll(repository.getSubjects());
  }

  Future<void> deleteSubject(int index) async {
    await repository.deleteSubject(index);
    loadSubjects();
    Get.snackbar("Success", "Subject Deleted", snackPosition: SnackPosition.BOTTOM);
  }
}
