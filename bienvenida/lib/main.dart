import 'package:bienvenida/src/pages/home_screen.dart';
import 'package:bienvenida/src/pages/login_screen.dart';
import 'package:bienvenida/src/pages/splash_screen.dart';
import 'package:bienvenida/src/pages/chat_screen.dart';
import 'package:bienvenida/src/pages/google_map_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "map",
      routes: {
        "map": (context) => const GoogleMapPage(),
        "splash": (context) => const SplashScreen(),
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "chat": (context) => const ChatScreen(),
      },
    );
  }
}
