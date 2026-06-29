import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/item_model.dart';
import '../../services/storage_service.dart';

class ReportFoundController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final contactController = TextEditingController();
  
  var selectedCategory = ''.obs;
  var selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      final item = ItemModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        category: selectedCategory.value,
        description: descriptionController.text,
        date: selectedDate.value,
        location: locationController.text,
        contactNumber: contactController.text,
        type: ItemType.found,
        status: ItemStatus.found,
      );
      
      await _storageService.addItem(item);
      Get.back();
      Get.snackbar('Success', 'Found item report submitted');
    }
  }
  
  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    contactController.dispose();
    super.onClose();
  }
}
