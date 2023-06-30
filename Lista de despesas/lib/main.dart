import 'package:flutter/material.dart';
import 'package:lista_tarefa/pages/home_page.dart';

void main() => runApp(const MinhaApp());

class MinhaApp extends StatefulWidget {
  const MinhaApp({super.key});

  @override
  MinhaAppState createState() {
    return MinhaAppState();
  }
}

class MinhaAppState extends State<MinhaApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: HomePage()
        ),
    );
  }
}
