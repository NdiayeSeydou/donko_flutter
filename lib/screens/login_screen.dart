import 'package:flutter/material.dart';
import 'package:donko_flutter/accueil/home_screen.dart'; // Importation de la page d'accueil

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Déplacement du contenu vers le haut
          children: [
            const SizedBox(height: 40), // Ajout d'espace en haut pour remonter "CONNEXION"

            // Logo/image
            Image.asset("assets/donko.png", width: 300, height: 300),
            const SizedBox(height: 10),

            // Texte CONNEXION
            const Text(
              "CONNEXION",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00788D),
              ),
            ),
            const SizedBox(height: 10),

            // Champ Email
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email, color: Color(0xFF00788D)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFF00788D)),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Champ Mot de passe
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF00788D)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF00788D),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFF00788D)),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Lien Mot de passe oublié
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Mot de passe oublié?",
                  style: TextStyle(color: Color(0xFFFFD045)),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Bouton Connexion (Navigation vers HomeScreen)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Redirection
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: const Color(0xFF00788D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "Connexion",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}