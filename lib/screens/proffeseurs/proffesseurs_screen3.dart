import 'package:flutter/material.dart';
import 'proffeseurs_screen2.dart'; // Import pour retourner en arrière

class ProfesseurScreen3 extends StatefulWidget {
  const ProfesseurScreen3({super.key});

  @override
  _ProfesseurScreen3State createState() => _ProfesseurScreen3State();
}

class _ProfesseurScreen3State extends State<ProfesseurScreen3> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProfesseurScreen2())), // Retour à ProfesseurScreen2
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Titre Professeur en bleu et grande taille
            const Text(
              "Professeur",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD045),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              "Veuillez saisir vos informations de contact et de connexion",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildTextField("Email", _emailController),
            _buildTextField("Téléphone", _phoneController),
            _buildTextField("Mot de passe", _passwordController, isPassword: true),
            _buildTextField("Confirmer le mot de passe", _confirmPasswordController, isPassword: true),

            // Checkbox pour accepter les conditions
            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _acceptTerms = newValue!;
                    });
                  },
                  activeColor: const Color(0xFF00788D),
                ),
                const Expanded(
                  child: Text("J'ai lu et j'accepte les conditions d'utilisation de l'application."),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Bouton pour finaliser l'inscription
            ElevatedButton(
              onPressed: () {}, // Action à définir
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFFFFD045),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text(
                "S'inscrire",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF00788D)), // Texte du label en bleu
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00788D)), // Bordures en bleu
          ),
        ),
      ),
    );
  }
}