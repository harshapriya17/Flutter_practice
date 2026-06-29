import 'package:get/get.dart';
import '../../data/models/item_model.dart';
import '../../services/storage_service.dart';

class ItemDetailsController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  late ItemModel item;

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments as ItemModel;
  }

  void markAsReturned() async {
    item.status = ItemStatus.returned;
    await _storageService.updateItem(item);
    update();
    Get.snackbar('Success', 'Item marked as returned');
  }

  void deleteItem() async {
    await _storageService.deleteItem(item);
    Get.snackbar('Deleted', 'Report deleted successfully');
  }
}
