import 'package:get/get.dart';
import '../../data/models/item_model.dart';
import '../../services/storage_service.dart';

class FoundItemsController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  
  final _allFoundItems = <ItemModel>[].obs;
  final filteredItems = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    _allFoundItems.value = _storageService.getAllItems().where((i) => i.type == ItemType.found).toList();
    filteredItems.value = _allFoundItems;
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      filteredItems.value = _allFoundItems;
    } else {
      filteredItems.value = _allFoundItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
