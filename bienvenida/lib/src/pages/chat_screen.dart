import 'dart:async';
import 'package:flutter/material.dart';

// Definir un modelo de mensaje para distinguir entre mensajes de usuario y chatbot
class Message {
  final String text;
  final bool isUserMessage;

  Message(this.text, {this.isUserMessage = true});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Agregar mensaje del usuario al final de la lista de mensajes
        _messages.add(Message(_controller.text));
        _controller.clear();
      });

      // Simular respuesta del chatbot después de 1 segundo
      _receiveMessage('¡Hola! Soy el chatbot.'); // Puedes personalizar este mensaje
    }
  }

  void _receiveMessage(String message) {
    Timer(Duration(seconds: 1), () {
      setState(() {
        // Agregar mensaje del chatbot al final de la lista de mensajes
        _messages.add(Message(message, isUserMessage: false));
      });
    });
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
      decoration: BoxDecoration(
        color: message.isUserMessage ? Colors.blue[200] : Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: message.isUserMessage ? Colors.black87 : Colors.black87,
          fontSize: 20.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chatbot',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF002B5C),
      ),
      body: Container(
        color: const Color(0xFF002B5C),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message.isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: _buildMessage(message),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Escribe un mensaje...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
