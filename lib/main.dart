import 'package:flutter/material.dart';
import 'package:calculator/calculator_screen.dart';

void main() {
  runApp(const CalculatorMain());
}

class CalculatorMain extends StatelessWidget {
  const CalculatorMain({super.key});

  static const appTitle = 'Drawer Demo';
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,  //key
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey),
      home: const Calculator(),
    );
  }
}

