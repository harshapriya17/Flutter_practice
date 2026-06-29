import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../core/constants/hive_boxes.dart';

class SettingsController extends GetxController {
  final settingsBox = Hive.box(HiveBoxes.settings);

  String get userName => settingsBox.get('userName', defaultValue: "User Name");
  String? get profileImage => settingsBox.get('profileImage');
  bool get isDarkMode => settingsBox.get('isDarkMode', defaultValue: false);

  @override
  void onInit() {
    super.onInit();
    settingsBox.listenable().addListener(update);
  }

  @override
  void onClose() {
    settingsBox.listenable().removeListener(update);
    super.onClose();
  }

  void updateUserName(String name) {
    settingsBox.put('userName', name);
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );
      if (image != null) {
        settingsBox.put('profileImage', image.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Error picking image: $e");
    }
  }

  Future<void> resetData() async {
    await Hive.box(HiveBoxes.subjects).clear();
    await Hive.box(HiveBoxes.tasks).clear();
    await Hive.box(HiveBoxes.sessions).clear();
    Get.snackbar("Success", "All data has been reset");
  }
}
