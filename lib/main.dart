import 'src/pages/home_screen.dart';
import 'src/pages/login_screen.dart';
import 'src/pages/splash_screen.dart';
import 'src/pages/chat_screen.dart';
import 'src/pages/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
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
