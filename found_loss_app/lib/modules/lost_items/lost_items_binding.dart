import 'package:get/get.dart';
import 'lost_items_controller.dart';

class LostItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LostItemsController>(() => LostItemsController());
  }
}
