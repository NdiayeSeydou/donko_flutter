import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'proffeseurs_screen2.dart'; // Import de la prochaine étape

class ProfesseurScreen extends StatefulWidget {
  const ProfesseurScreen({super.key});

  @override
  _ProfesseurScreenState createState() => _ProfesseurScreenState();
}

class _ProfesseurScreenState extends State<ProfesseurScreen> {
  XFile? _image; // Stocke l'image sélectionnée
  final TextEditingController _dateController = TextEditingController(); // Stocke la date sélectionnée
  String? _selectedNationality; // Stocke la nationalité sélectionnée
  String _selectedGender = "Homme"; // Genre sélectionné (par défaut Homme)

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

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
              "Veuillez saisir vos informations démographiques",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Sélection de l'image de profil
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
                child: _image == null ? const Icon(Icons.camera_alt, size: 40, color: Colors.black) : null,
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField("Prénom"),
            _buildTextField("Nom"),
            
            // Champ Naissance avec calendrier
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Naissance (jj/mm/aaaa)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF00788D)),
                ),
                prefixIcon: const Icon(Icons.calendar_today, color: Color(0xFF00788D)),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 15),

            // Sélection du genre (Homme/Femme)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: "Homme",
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value.toString();
                        });
                      },
                      activeColor: const Color(0xFF00788D),
                    ),
                    const Text("Homme"),
                  ],
                ),
                const SizedBox(width: 40), // Espacement entre les options
                Row(
                  children: [
                    Radio(
                      value: "Femme",
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value.toString();
                        });
                      },
                      activeColor: const Color(0xFF00788D),
                    ),
                    const Text("Femme"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Champ Nationalité
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Choisir une nationalité",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF00788D)),
                ),
              ),
              items: [],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedNationality = newValue;
                });
              },
            ),
            const SizedBox(height: 40),

            // Bouton pour aller à ProfesseurScreen2
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfesseurScreen2()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                backgroundColor: const Color(0xFFFFD045), // Couleur jaune
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Icon(Icons.arrow_forward, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00788D)),
          ),
        ),
      ),
    );
  }
}