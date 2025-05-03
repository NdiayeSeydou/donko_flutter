import 'package:flutter/material.dart';
import 'eleve_etudiants_screen.dart'; // Import du retour en arrière
import 'eleve_etudiants_screen3.dart'; // Import de la page suivante

class EleveEtudiantScreen2 extends StatefulWidget {
  const EleveEtudiantScreen2({super.key});

  @override
  _EleveEtudiantScreen2State createState() => _EleveEtudiantScreen2State();
}

class _EleveEtudiantScreen2State extends State<EleveEtudiantScreen2> {
  String? _niveau;
  String? _filiere;
  String? _specialite;
  String? _etablissement;
  String? _adresse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EleveEtudiantScreen())), // Retour à EleveEtudiantScreen
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Titre Élève / Étudiant en bleu et grande taille
            const Text(
              "Élève / Étudiant",
              style: TextStyle(
                fontSize: 32, // Augmentation de la taille
                fontWeight: FontWeight.bold,
                color: Color(0xFF00788D), // Couleur modifiée
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              "Veuillez fournir vos informations scolaires",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildDropdownField("Niveau", _niveau),
            _buildDropdownField("Filière", _filiere),
            _buildDropdownField("Spécialité", _specialite),
            _buildDropdownField("Établissement", _etablissement),
            _buildDropdownField("Adresse", _adresse),

            const SizedBox(height: 40),

            // Bouton pour aller à EleveEtudiantScreen3
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EleveEtudiantScreen3()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                backgroundColor: const Color(0xFF00788D),
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
        items: [],
        onChanged: (String? newValue) {
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}