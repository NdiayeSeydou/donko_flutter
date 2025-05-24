import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  final List<Map<String, String>> downloads = const [
    {
      'title': 'Fonctions trigonométriques',
      'subtitle': '66,3 Mo / 88 Mo',
    },
    {
      'title': 'Mathématiques - Suites numériques',
      'subtitle': '1,3 Mo / 2,6 Mo',
    },
    {
      'title': 'Satellites',
      'subtitle': '60,3 Mo / 60,3 Mo',
    },
    {
      'title': 'Corrigé - Arithmétique',
      'subtitle': '2,5 Mo / 2,5 Mo',
    },
    {
      'title': 'Les alcools',
      'subtitle': '30,1 Mo / 30,1 Mo',
    },
    {
      'title': 'Barycentre',
      'subtitle': '27,8 Mo / 27,8 Mo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Téléchargements",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemCount: downloads.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = downloads[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.picture_as_pdf, color: Colors.red, size: 30),
                    Text("PDF", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            title: Text(
              item['title']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              item['subtitle']!,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.teal.shade100,
              child: const Icon(Icons.download, color: Colors.teal),
            ),
          );
        },
      ),
    );
  }
}