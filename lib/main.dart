import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const DemoGetxApp());
}

class DemoGetxApp extends StatelessWidget {
  const DemoGetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temp Users',
      home: Home(),
    );
  }
}
