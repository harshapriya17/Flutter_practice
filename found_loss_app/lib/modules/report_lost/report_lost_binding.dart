import 'package:get/get.dart';
import 'report_lost_controller.dart';

class ReportLostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportLostController>(() => ReportLostController());
  }
}
