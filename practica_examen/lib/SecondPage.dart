import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget{
  const Secondpage ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("aaaa4")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("aaa5"),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("aaaa6"),
            ),
          ],
        ),
      ),
    );
  }
}
