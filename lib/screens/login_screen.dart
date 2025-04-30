import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedLanguage = 'Français'; // Langue par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo cliquable
            GestureDetector(
              onTap: () {
                // Action quand on clique sur le logo (optionnel)
              },
              child: Column(
                children: [
                  Icon(Icons.school, size: 100, color: Colors.teal),
                  const SizedBox(height: 10),
                  const Text(
                    "dɔnko",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu déroulant pour choisir la langue
            DropdownButton<String>(
              value: _selectedLanguage,
              items: ['Français', 'Anglais', 'Bambara'].map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Boutons de connexion et d'inscription
            ElevatedButton(
              onPressed: () {
                // Redirection vers connexion
              },
              child: const Text("Se connecter"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Redirection vers inscription
              },
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}