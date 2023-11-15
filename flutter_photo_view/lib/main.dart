import 'package:flutter/material.dart';

import 'examples/HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Photo View',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
