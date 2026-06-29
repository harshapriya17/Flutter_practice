import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../data/models/item_model.dart';

class StorageService extends GetxService {
  late Box<ItemModel> _itemBox;

  Future<StorageService> init() async {
    _itemBox = Hive.box<ItemModel>('items');
    return this;
  }

  List<ItemModel> getAllItems() {
    return _itemBox.values.toList();
  }

  Future<void> addItem(ItemModel item) async {
    await _itemBox.put(item.id, item);
  }

  Future<void> updateItem(ItemModel item) async {
    await item.save();
  }

  Future<void> deleteItem(ItemModel item) async {
    await item.delete();
  }
}
