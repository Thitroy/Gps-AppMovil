import 'package:flutter/material.dart';
import 'package:bienvenida/src/pages/chat_screen.dart'; // Importa la pantalla del chatbot
 // Asegúrate de que esta es la única importación de ChatScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen del mapa
          Positioned.fill(
            child: Image.asset(
              'assets/img-copia.jpg', // Asegúrate de que la ruta sea correcta
              fit: BoxFit.cover,
            ),
          ),
          // Botones en la parte inferior
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              children: [
                // Botón Chatbot
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "chat");
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.chat, color: Colors.white),
                  heroTag: 'chatbot',
                ),
                const SizedBox(height: 10),
                // Botón Ubicación de Salas
                FloatingActionButton(
                  onPressed: () {
                    // Lógica para el botón de ubicación de salas
                    Navigator.pushNamed(context, "map");
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.location_on, color: Colors.white),
                  heroTag: 'location',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
