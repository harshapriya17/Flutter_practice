import 'package:get/get.dart';
import 'found_items_controller.dart';

class FoundItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoundItemsController>(() => FoundItemsController());
  }
}
