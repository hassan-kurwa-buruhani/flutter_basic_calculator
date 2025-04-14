import 'package:flutter/material.dart';
import 'features/calculator/presentation/screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Calculator",
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue
      ),
      home: CalculatorScreen(),
    );
  }
}
