import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'eleve_etudiants_screen2.dart'; // Import de la nouvelle page
import 'accueil_screen.dart'; // Import pour retourner en arrière

class EleveEtudiantScreen extends StatefulWidget {
  const EleveEtudiantScreen({super.key});

  @override
  _EleveEtudiantScreenState createState() => _EleveEtudiantScreenState();
}

class _EleveEtudiantScreenState extends State<EleveEtudiantScreen> {
  XFile? _image;
  String _selectedGender = "Homme";
  String? _selectedNationality;
  final TextEditingController _dateController = TextEditingController();

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
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AccueilScreen())); // Retour à AccueilScreen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Élève / Étudiant",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
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

            // Bouton vers `EleveEtudiantScreen2`
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EleveEtudiantScreen2()));
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