import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 137, 243),
        ),
      ),
      home: const MyHomePage(title: 'Practica 1 de Jatz'),
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

  final List<int> _historial = [];
  bool _mostratHistorial = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _historial.add(_counter);
    });
  }

  void _decrementCounter() {
    if (_counter <= 0) {
      _showMyDialog();
    } else {
      setState(() {
        _counter--;
        _historial.add(_counter);
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Hijoles que crees, no puedes tener números negativos, ni modo dote',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okidoki'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _mostrarHistorial() {
    setState(() {
      if (_mostratHistorial) {
        _mostratHistorial = false;
      } else {
        _mostratHistorial = true;
      }
    });
  }

  void _borrarHistorial() {
    setState(() {
      _counter = 0;
      _historial.clear();
    });
  }

  Widget _listaValores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Historial:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Los valores del contador han sido:",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),

        _historial.isEmpty
            ? const Text("No hay historial")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _historial.map((n) => Text("- $n")).toList(),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_mostratHistorial) _listaValores(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 32), // margen de la orilla
              FloatingActionButton(
                onPressed: _borrarHistorial,
                tooltip: 'Delete',
                //icono de eliminar diferente al delete
                child: const Icon(Icons.delete_forever),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                onPressed: _mostrarHistorial,
                tooltip: 'Show',
                child: const Icon(Icons.history),
              ),
            ],
          ),
          Row(
            children: [
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 32), // margen de la orilla
            ],
          ),
        ],
      ),
    );
  }
}
