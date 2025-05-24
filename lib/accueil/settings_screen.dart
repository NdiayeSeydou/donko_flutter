import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          _buildSettingsOption(context, "Général", Icons.settings, "/general"),
          _buildSettingsOption(context, "Compte", Icons.person, "/account"),
          _buildSettingsOption(context, "Téléchargement", Icons.download, "/downloads"),
          _buildSettingsOption(context, "Aide", Icons.help, "/help"),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pushNamed(context, route); // Navigation vers la page correspondante
      },
    );
  }
}