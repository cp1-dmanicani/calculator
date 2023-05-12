import 'package:flutter/material.dart';


class Scientific extends StatefulWidget {
  const Scientific({super.key});
  @override
  State<StatefulWidget> createState() => _Scientific();
}

///Class for Scientific calculations
class _Scientific extends State<Scientific> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Scientific Calculator',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const TextField(

          ),
        ],
      ),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({super.key});
  @override
  State<StatefulWidget> createState() => _BMI();
}

///Class for BMI calculations
class _BMI extends State<BMI> {
  var heightControl = TextEditingController();
  var weightControl = TextEditingController();
  var resultBMI = '';
  var bmiStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'BMI Calculator',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),

      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: heightControl,
                  decoration: const InputDecoration(
                    label: Text(
                      'Enter Your Height (in cm)',
                      style: TextStyle(fontSize: 16, color: Colors.black38),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 20
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: weightControl,
                  decoration: const InputDecoration(
                    label: Text(
                      'Enter Your Weight (in kg)',
                      style: TextStyle(fontSize: 16, color: Colors.black38),
                    ),
                    prefixIcon: Icon(Icons.monitor_weight_outlined),
                  ),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 20
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var height = heightControl.text.toString();
                      var weight = weightControl.text.toString();

                      if (height != '' && weight != '') {
                        //BMI Calculation
                          var heightVal = int.parse(height);
                          var weightVal = int.parse(weight);
                          double bmiVal = (weightVal/(heightVal*heightVal))*10000;

                          if (bmiVal >= 25) {
                            bmiStatus = 'You are overweight. Consider losing weight.';
                          } else if (bmiVal <= 18.5) {
                            bmiStatus = 'You are underweight. Consider gaining weight.';
                          } else {
                            bmiStatus = 'You have a healthy BMI. Good work!';
                          }
                          setState(() {
                            resultBMI = 'Your BMI is: ${bmiVal.toStringAsFixed(2)}';
                          });
                      }
                      else {
                        setState(() {
                          resultBMI = "Please fill all required fields!";
                        });
                      }
                    },
                    child: const Text(
                        'Calculate'
                    ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  resultBMI,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  bmiStatus,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///Class for Length conversions
class LengthConv extends StatelessWidget {
  const LengthConv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Length Conversion',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}

///Class for Weight conversions
class WeightConv extends StatelessWidget {
  const WeightConv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Weight Conversion',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}

///Class for Temperature conversions
class TemperatureConv extends StatelessWidget {
  const TemperatureConv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Temperature Conversion',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}

///Class for Currency conversions
class CurrencyConv extends StatelessWidget {
  const CurrencyConv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Currency Conversion',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}

///Class for Fiat to Cryptocurrency conversions
class FiatToCryptoConv extends StatelessWidget {
  const FiatToCryptoConv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Fiat to Crypto Conversion',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}


