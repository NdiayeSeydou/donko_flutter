import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Image.asset(
                    "assets/Donko.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Row(
                    children: const [
                      Text("DP", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00788D))),
                      SizedBox(width: 4),
                      Text("208", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.favorite, color: Colors.red, size: 24),
                      SizedBox(width: 4),
                      Text("3", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ClipOval(
                  child: Image.asset(
                    "assets/profil.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Rechercher ...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Récent"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildResourceItem("PDF", "Chp 3 - Physique"),
                      _buildResourceItem("▶", "Satellites"),
                      _buildResourceItem("PDF", "Exo Arithmétique"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Recommandations"),
                  const SizedBox(height: 10),
                  _buildRecommendationItem(Icons.play_arrow, "Fonctions trigonométriques", Colors.yellow[100]),
                  const SizedBox(height: 10),
                  _buildRecommendationPDF(),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Mes quizzs"),
                  const SizedBox(height: 10),
                  _buildQuizItem("Chimie Isomérie", 87, "+15 DP"),
                  _buildQuizItem("Mathématiques Trigonométrie", 23, "+20 DP"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 1) Navigator.pushNamed(context, '/downloads');
          if (index == 2) Navigator.pushNamed(context, '/discussions');
          if (index == 3) Navigator.pushNamed(context, '/settings');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(width: 6),
        const Icon(Icons.chevron_right),
      ],
    );
  }

  Widget _buildResourceItem(String label, String title) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildRecommendationItem(IconData icon, String title, Color? bgColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: bgColor,
      child: Row(
        children: [
          Icon(icon, size: 40),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildRecommendationPDF() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Mathématiques Suites numériques", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("PDF Gratuit - Par Mr. Malick"),
          Text("Suites arithmétiques et géométriques"),
        ],
      ),
    );
  }

  Widget _buildQuizItem(String title, int progress, String points) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.flash_on, color: Colors.teal),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(points),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.teal,
            ),
            const SizedBox(height: 5),
            Text("$progress%"),
          ],
        ),
      ),
    );
  }
}
