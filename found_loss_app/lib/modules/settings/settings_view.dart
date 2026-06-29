import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/appbar.dart';
import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: const CustomAppBar(
        title: 'Settings',
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionHeader('Preferences'),
          Obx(() => _buildSwitchTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                value: controller.isDarkMode.value,
                onChanged: (val) => controller.isDarkMode.value = val,
              )),
          Obx(() => _buildSwitchTile(
                icon: Icons.notifications_active_outlined,
                title: 'Push Notifications',
                value: controller.isNotificationsEnabled.value,
                onChanged: (val) => controller.isNotificationsEnabled.value = val,
              )),
          Obx(() => _buildSwitchTile(
                icon: Icons.location_on_outlined,
                title: 'Location Access',
                value: controller.isLocationEnabled.value,
                onChanged: (val) => controller.isLocationEnabled.value = val,
              )),
          const SizedBox(height: 24),
          _buildSectionHeader('Support'),
          _buildMenuButton(Icons.help_outline, 'Help Center'),
          _buildMenuButton(Icons.description_outlined, 'Terms of Service'),
          _buildMenuButton(Icons.privacy_tip_outlined, 'Privacy Policy'),
          const SizedBox(height: 24),
          _buildSectionHeader('Account'),
          _buildMenuButton(Icons.person_outline, 'Edit Profile'),
          _buildMenuButton(Icons.language, 'Language', trailing: 'English'),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'App Version 1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1E3A8A),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1E3A8A)),
        title: Text(title),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF1E3A8A),
        ),
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String title, {String? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1E3A8A)),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null)
              Text(trailing, style: const TextStyle(color: Colors.grey)),
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
