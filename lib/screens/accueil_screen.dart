import 'package:flutter/material.dart';
import 'package:donko_flutter/screens/login_screen.dart';
import 'package:donko_flutter/screens/inscription_screen.dart';

class AccueilScreen extends StatefulWidget {
  const AccueilScreen({super.key});

  @override
  _AccueilScreenState createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  String selectedLanguage = "FR"; // Langue abrégée
  Map<String, String> languageOptions = {
    "FR": "Français",
    "AN": "Anglais",
    "BA": "Bambara",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône du globe et texte de langue sur la même ligne
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.public, size: 24, color: Colors.black), // Icône monde
                    onSelected: (String newValue) {
                      setState(() {
                        selectedLanguage = newValue;
                      });
                    },
                    itemBuilder: (BuildContext context) => languageOptions.entries.map(
                      (entry) => PopupMenuItem<String>(
                        value: entry.key,
                        child: Text(entry.value), // Affiche le nom complet dans la liste déroulante
                      ),
                    ).toList(),
                  ),
                  const SizedBox(width: 8), // Ajout d'un espace entre l'icône et le texte
                  Text(
                    selectedLanguage,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Texte BIENVENUE centré avec une grande police
            const Text(
              "BIENVENUE",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Image "dɔnko_livre.png"
            Image.asset("assets/donko_livre.png", width: 100, height: 100),
            const SizedBox(height: 10),
            const Text(
              "dɔnko",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Texte descriptif
            const Text(
              "Votre espace d'étude et d'enseignements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Boutons avec séparateur "OU"
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF00788D),
                  ),
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),

                // Séparateur avec "OU"
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1, color: Colors.black)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OU", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    const Expanded(child: Divider(thickness: 1, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 10),

                // Bouton S'inscrire
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const InscriptionScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text("S'inscrire"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}