import 'package:get/get.dart';
import '../../data/models/item_model.dart';
import '../../services/storage_service.dart';

class LostItemsController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  
  final _allLostItems = <ItemModel>[].obs;
  final filteredItems = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    _allLostItems.value = _storageService.getAllItems().where((i) => i.type == ItemType.lost).toList();
    filteredItems.value = _allLostItems;
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      filteredItems.value = _allLostItems;
    } else {
      filteredItems.value = _allLostItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
