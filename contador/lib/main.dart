import 'package:flutter/material.dart';

void main() => runApp(const ContadorApp());

class ContadorApp extends StatefulWidget {
  const ContadorApp({super.key});

  @override
  ContadorAppState createState() {
    return ContadorAppState();
  }
}

class ContadorAppState extends State<ContadorApp> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  void decrementar() {
    setState(() {
      contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contador'),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Contador',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Você clicou $contador vezes',
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: contador > 0 ? decrementar : null,
                                child: const Text('-',
                                    style: TextStyle(fontSize: 20))),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: incrementar,
                                child: const Text('+',
                                    style: TextStyle(fontSize: 20))),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
