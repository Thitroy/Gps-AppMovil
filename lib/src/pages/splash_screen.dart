import 'package:bienvenida/src/pages/home_screen.dart';
import 'package:bienvenida/src/pages/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 5);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
                subtitleTextStyle:
                    TextStyle(color: Colors.white70, fontSize: 18), // Subtítulo
                title: Text("GPS App", textAlign: TextAlign.center),
                subtitle: Text("Bienvenido estudiantes",
                    textAlign: TextAlign.center), // Subtítulo
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(70),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
