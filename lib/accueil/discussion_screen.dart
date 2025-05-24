import 'package:flutter/material.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Discussions", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.group, color: Colors.black),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
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
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterChip("Non lus", false),
                _buildFilterChip("Aujourd'hui", true),
                _buildFilterChip("Support", false),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMessageTile("Mr David", "Support : Mathématiques - Suites numériques", "14h08"),
                  _buildMessageTile("Mme Adjaratou", "Non c’est différent du premier cas", "13h05", unread: true),
                  _buildMessageTile("Mr Oumar", "Le cours de demain est reporté au 10", "10h03"),
                  _buildMessageTile("Mr Balla", "Support : Corrigé - Arithmétique", "hier", hasLink: true),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // position actuelle: discussions
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 1) Navigator.pushNamed(context, '/download');
          if (index == 2) Navigator.pushNamed(context, '/discussion');
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

  Widget _buildFilterChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.teal : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: selected ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildMessageTile(String sender, String message, String time, {bool unread = false, bool hasLink = false}) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(backgroundImage: AssetImage("assets/profil.png")),
          title: Text(sender, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (unread) const Icon(Icons.circle, size: 10, color: Colors.teal),
              if (hasLink) const Icon(Icons.link),
              if (!unread && !hasLink) Text(time),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
