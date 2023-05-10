import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/nav_bar.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String userInput = "";
  String result = "0";
  List<String> buttons = [
    'AC', '(', ')', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', '<-', '='  ];

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 50,
            ),
            Text(
                'Calculator',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            alignment: Alignment.topLeft,
            color: Colors.white,
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
              icon: const Icon(Icons.menu))
        ],
      ),
      ///Navigation Bar
      endDrawer: const NavBar(),
      ///
      backgroundColor: const Color(0xFF1d2630),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(color: Colors.white),
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ), itemBuilder: (BuildContext context, int index) {
                    return customButton(buttons[index]);
                }),
          )),
        ],
      ),
    );
  }

  Widget customButton(String text) {
    return InkWell(
      splashColor: const Color(0xFF1d2630),
      onTap: () {
        setState(() {
          handleButtons(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getBGColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: const Offset(-3,-3)
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: getColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Function to change color of the operand button text.
  getColor(String text) {
    if (text == "/" || text == "*" || text == "+" || text == "-" || text == "(" || text == ")") {
      return const Color.fromARGB(255, 252, 100, 100);
    }
    
    if (text == "<-") {
      return const Color.fromARGB(255, 255, 255, 1);
    }
    
    return Colors.white;
  }

  /// Function to change physical color of the buttons.
  getBGColor(String text) {
    switch (text.toString()) {
      case "AC":
        return const Color.fromARGB(255, 252, 100, 100);
      case "=":
        return const Color.fromARGB(255, 104, 204, 159);
    }
    return const Color(0xFF1d2630);
  }

  ///Function to handle the operations when a value is inputted using the button values.
  handleButtons(String text) {
    switch (text.toString()) {
      case "AC":
        userInput = "";
        result = "0";
        return;
      case "<-":
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
          return;
        }
        else {
          return null;
        }
      case "=":
        result =  calculate();
        userInput = result;

        if (userInput.endsWith(".0")) {
          userInput = userInput.replaceAll("0.", "");
          return;
        }

        if (result.endsWith(".0")) {
          result = result.replaceAll("0.", "");
          return;
        }
        return;
    }
    userInput = userInput + text;
  }

  ///String function to calculate the user input expression.
  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      return eval.toString();
    } catch (e) {
      return "Error";
    }
  }

  ///END
  ///---------------------------------------------------------------------
}