import 'package:flutter/material.dart';
import 'proffeseurs_screen.dart'; // Import du retour en arrière
import 'proffesseurs_screen3.dart'; // Import de la page suivante

class ProfesseurScreen2 extends StatefulWidget {
  const ProfesseurScreen2({super.key});

  @override
  _ProfesseurScreen2State createState() => _ProfesseurScreen2State();
}

class _ProfesseurScreen2State extends State<ProfesseurScreen2> {
  String? _matieres;
  String? _classes;
  String? _etablissements;
  String? _role;
  String? _ville;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProfesseurScreen())), // Retour à ProfesseurScreen
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
                fontSize: 32, // Augmentation de la taille
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD045), // Couleur modifiée
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              "Veuillez fournir vos informations d'enseignements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildDropdownField("Matière(s) enseignée(s)", _matieres),
            _buildDropdownField("Classe(s) d'enseignement", _classes),
            _buildDropdownField("Établissement(s)", _etablissements),
            _buildDropdownField("Rôle", _role),
            _buildDropdownField("Ville", _ville),

            const SizedBox(height: 40),

            // Bouton pour aller à ProfesseurScreen3
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfesseurScreen3()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                backgroundColor: const Color(0xFFFFD045), // Bouton jaune
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Icon(Icons.arrow_forward, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF00788D)), // Texte du label en bleu
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00788D)), // Bordures en bleu
          ),
        ),
        items: [], // Liste vide pour l'instant
        onChanged: (String? newValue) {
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}