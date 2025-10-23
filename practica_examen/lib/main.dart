import 'package:flutter/material.dart';
import 'package:practica_examen/Student.dart';

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
          seedColor: const Color.fromARGB(255, 243, 164, 244),
        ),
      ),
      home: const MyHomePage(title: 'Practica de examen'),
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
  bool _muestraHistorial = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter <= 0) {
      Text("No se puede");
    } else {
      setState(() {
        _counter--;
        _historial.add(_counter);
      });
    }
  }

  void _mostrarHistorial() {
    setState(() {
      if (_muestraHistorial) {
        _muestraHistorial = false;
      } else {
        _muestraHistorial = true;
      }
    });
  }

  void borrarHistorial() {
    setState(() {
      _counter = 0;
      _historial.clear();
    });
  }

  final Student student = Student("jatz", "20223tn062");
  List<Student> studentList = [];

  Widget _getAll() {
    if (studentList.isEmpty) {
      return const Text("escribe algo");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text("nose"),
        const SizedBox(height: 12),
        ...studentList.map((n) => Text("-${n.name}(${n.studentId})")).toList(),
      ],
    );
  }

  final TextEditingController _txtNameController = TextEditingController();
  final TextEditingController _txtStudentController = TextEditingController();

  void _addStudent() {
    final name = _txtNameController.text.trim();
    final studentId = _txtStudentController.text.trim();
    if (name.isEmpty || studentId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("aaa")));
      setState(() {
        studentList.add(Student(name, studentId));
        _txtNameController.clear();
        _txtStudentController.clear();
      });
    }
  }

  //arreglar
  Widget _listaValores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("yey", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Text("aaaaa2", style: TextStyle(fontStyle: FontStyle.italic)),
        _historial.isEmpty
            ? const Text("aaaa3")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [..._historial.map((n) => Text("-${n}")).toList()],
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 12),
            child: ElevatedButton(onPressed: _m, child: child),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
