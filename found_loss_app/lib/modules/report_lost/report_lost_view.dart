import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'report_lost_controller.dart';

class ReportLostView extends GetView<ReportLostController> {
  const ReportLostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report Lost Item')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                decoration: const InputDecoration(labelText: 'Category'),
                items: ['Electronics', 'Documents', 'Wallets', 'Keys', 'Other']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) => controller.selectedCategory.value = val ?? '',
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.locationController,
                decoration: const InputDecoration(labelText: 'Location Lost'),
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.contactController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              Obx(() => ListTile(
                    title: Text('Date Lost: ${controller.selectedDate.value.toLocal().toString().split(' ')[0]}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => controller.selectDate(context),
                  )),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: controller.submit,
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
