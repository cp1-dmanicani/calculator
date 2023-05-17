import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';


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
  var ageControl = TextEditingController();
  var resultBMI = '';
  var bmiStatus = '';
  double bmiVal = 0.0;

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
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: heightControl,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Your Height (in cm)',
                      style: TextStyle(fontSize: 16, color: Colors.black38),
                    ),
                    prefixIcon: Icon(Icons.height),
                    border: myInputBorder(),
                    enabledBorder: myInputBorder(),
                  ),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 20
                  ),
                  keyboardType: TextInputType.number,
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  controller: weightControl,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Your Weight (in kg)',
                      style: TextStyle(fontSize: 16, color: Colors.black38),
                    ),
                    prefixIcon: Icon(Icons.monitor_weight_outlined),
                    border: myInputBorder(),
                    enabledBorder: myInputBorder(),
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
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black45)
                      ),
                    ),
                  ),
                    onPressed: () {
                      var height = heightControl.text.toString();
                      var weight = weightControl.text.toString();

                      if (height != '' && weight != '') {
                        //BMI Calculation
                          var heightVal = int.parse(height);
                          var weightVal = int.parse(weight);
                          bmiVal = (weightVal/(pow(heightVal, 2)))*10000;

                          if (bmiVal >= 30 ) {
                            bmiStatus = 'You are obese. Your health may be at risk. Please consider changing your lifestyle and diet.';
                          } else if (bmiVal >= 25) {
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
                        'Calculate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Divider(
                  height: 3,
                  color: Colors.black54,
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
                  textAlign: TextAlign.center,
                ),
                Text(
                  bmiStatus,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
                RadialGauge(
                  axes: [
                    RadialGaugeAxis(
                      color: Colors.black26,
                      minValue: 0,
                      maxValue: 50,
                      minAngle: -90,
                      maxAngle: 90,
                      radius: 0.6,
                      width: 0.3,
                      segments: [
                        RadialGaugeSegment(
                          minValue: 0,
                          maxValue: 18.5,
                          minAngle: -90,
                          maxAngle: -23,
                          color: Colors.blue,
                        ),
                        RadialGaugeSegment(
                          minValue: 18.6,
                          maxValue: 24.9,
                          minAngle: -23,
                          maxAngle: 0,
                          color: Colors.green,
                        ),
                        RadialGaugeSegment(
                          minValue: 25,
                          maxValue: 29.9,
                          minAngle: 0,
                          maxAngle: 18,
                          color: Colors.orange,
                        ),
                        RadialGaugeSegment(
                          minValue: 30,
                          maxValue: 50,
                          minAngle: 18,
                          maxAngle: 90,
                          color: Colors.red,
                        ),
                      ],
                      pointers: [
                        RadialNeedlePointer(
                          value: bmiVal,
                          thicknessStart: 15,
                          thicknessEnd: 2,
                          length: 0.5,
                          knobRadiusAbsolute: 10,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ],
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

///Class to add a border outline on a TextField
OutlineInputBorder myInputBorder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextField
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color:Colors.black45,
        width: 3,
      )
  );
}


