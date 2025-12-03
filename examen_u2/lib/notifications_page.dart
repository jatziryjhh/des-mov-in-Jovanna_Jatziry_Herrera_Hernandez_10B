import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String _lastTitle = 'Sin notificaciones';
  String _lastBody = '';

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;

      if (notification != null) {
        setState(() {
          _lastTitle = notification.title ?? 'Sin título';
          _lastBody = notification.body ?? 'Sin contenido';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notificación: ${notification.title ?? 'Sin título'}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: const Text("Notificaciones"),
        backgroundColor: const Color.fromARGB(255, 245, 67, 248),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Última notificación recibida:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Tarjetita bonita
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 99, 54, 247).withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _lastTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    _lastBody,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(221, 102, 59, 222),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Para probar:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "• Ve a Firebase Console → Cloud Messaging.\n"
              "• Envía una notificación con título y cuerpo.\n"
              "• Mantén esta pantalla abierta para ver el SnackBar y la actualización.",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}