import 'package:get/get.dart';
import 'report_found_controller.dart';

class ReportFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportFoundController>(() => ReportFoundController());
  }
}
