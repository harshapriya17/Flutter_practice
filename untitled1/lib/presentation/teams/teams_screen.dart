import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'teams_controller.dart';

class TeamsScreen extends GetView<TeamsController> {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teams')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final team = controller.teams[index];
            return ListTile(
              title: Text(team.name),
              subtitle: Text('${team.membersCount} members'),
              trailing: Chip(label: Text(team.role)),
            );
          },
        );
      }),
    );
  }
}
