import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:  Text("Reddit Pro", style: TextStyle(color: Colors.white)), backgroundColor: const Color.fromRGBO(37,37,37, 1)));
  }
}
