import 'package:flutter/material.dart';
import 'package:donko_flutter/screens/splash_screen.dart';
import 'package:donko_flutter/accueil/home_screen.dart';
import 'package:donko_flutter/accueil/download_screen.dart';
import 'package:donko_flutter/accueil/discussion_screen.dart';
import 'package:donko_flutter/accueil/settings_screen.dart'; // Ajout de SettingsScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/downloads': (context) => const DownloadScreen(),
        '/discussions': (context) => const DiscussionScreen(),
        '/settings': (context) => const SettingsScreen(), // Ajout ici
      },
    );
  }
}