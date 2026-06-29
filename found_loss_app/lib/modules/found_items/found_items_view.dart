import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'found_items_controller.dart';

class FoundItemsView extends GetView<FoundItemsController> {
  const FoundItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Found Items'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: controller.searchItems,
              decoration: InputDecoration(
                hintText: 'Search by item name...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.filteredItems.isEmpty) {
          return const Center(child: Text('No found items reported.'));
        }
        return ListView.builder(
          itemCount: controller.filteredItems.length,
          itemBuilder: (context, index) {
            final item = controller.filteredItems[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('${item.category} - ${item.location}'),
              trailing: Text(item.status.name.toUpperCase()),
              onTap: () => Get.toNamed('/item-details', arguments: item),
            );
          },
        );
      }),
    );
  }
}
