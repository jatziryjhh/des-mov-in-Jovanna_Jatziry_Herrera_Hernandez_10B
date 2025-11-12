import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coquette Disney Soft',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC7E3), // Rosa pastel suave
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8FB), // fondo rosita casi blanco
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFFD9EC),
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xFF7A4B6C),
            fontSize: 20,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Demo Jatz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.auto_awesome, color: Color(0xFF7A4B6C)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.favorite_border, color: Color(0xFF7A4B6C)),
          ),
        ],
        title: Text(widget.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título Cute pero suave
            const Text(
              'Se lo que quieras ser, se Barbie',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7A4B6C),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _coquetteCard('Belleza', Icons.brush_outlined, const Color(0xFFFFC7E3)),
                _coquetteCard('Moda', Icons.style, const Color(0xFFE7C7FF)),
                _coquetteCard('Chill', Icons.local_cafe, const Color(0xFFD8E7FF)),
              ],
            ),

            const SizedBox(height: 40),

            _sectionBox(
              'Do you feel bonita? 🧚‍♀️\nNo, I don\'t feel bonita 🧚‍♀️\n Wonderful bonita🧚‍♀️',
              const Color(0xFFFFD9EC),
            ),
            const SizedBox(height: 16),
            _sectionBox(
              'Tip del día:\nRespira hondo, tú puedes con todo.',
              const Color(0xFFE7C7FF),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFA4D6),
        onPressed: _incrementCounter,
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }

  Widget _coquetteCard(String text, IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 26, color: Color(0xFF7A4B6C)),
              const SizedBox(height: 6),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF7A4B6C),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionBox(String text, Color color) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF7A4B6C),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}