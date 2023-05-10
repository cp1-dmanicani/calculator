import 'package:flutter/material.dart';
import 'package:calculator/calculator_screen.dart';

void main() {
  runApp(const CalculatorMain());
}

class CalculatorMain extends StatelessWidget {
  const CalculatorMain({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const Calculator(),
    );
  }
}

