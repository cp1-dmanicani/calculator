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
            width: 350,
            child: SingleChildScrollView(
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
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiStatus,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

class BodyFatCalculation extends StatefulWidget {
  const BodyFatCalculation({super.key});
  @override
  State<StatefulWidget> createState() => _BodyFatCalculation();
}

///Class for Body Fat Calculations
class _BodyFatCalculation extends State<BodyFatCalculation> {
  int genderVal = 1;
  bool isShow = true;
  var ageControlText = TextEditingController();
  var heightControlText = TextEditingController();
  var weightControlText = TextEditingController();
  var neckControlText = TextEditingController();
  var waistControlText = TextEditingController();
  var hipControlText = TextEditingController();

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
              'Body Fat Calculation',
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
        padding: EdgeInsets.all(5),
        child: Center(
          child: Container(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      'Your Gender',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              genderVal = 0; //Male
                              isShow = false;
                            });
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: genderVal == 0 ? Colors.black26 : Colors.transparent,
                            child: Column(
                              children: [
                                Container(height: 5,),
                                Icon(Icons.man, size: 60,),
                                Container(height: 2,),
                                Text('Male',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              genderVal = 1; //Female
                              isShow = true;
                            });
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            color: genderVal == 1 ? Colors.black26 : Colors.transparent,
                            child: Column(
                              children: [
                                Container(height: 5,),
                                Icon(Icons.woman, size: 60,),
                                Container(height: 2,),
                                Text('Female',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: ageControlText,
                    decoration: InputDecoration(
                      label: Text(
                        'Enter Your Age',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      prefixIcon: Icon(Icons.person),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                    ),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 10,),
                  TextField(
                    controller: weightControlText,
                    decoration: InputDecoration(
                      label: Text(
                        'Enter Your Weight (in kg)',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      prefixIcon: Icon(Icons.monitor_weight),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                    ),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 10,),
                  TextField(
                    controller: heightControlText,
                    decoration: InputDecoration(
                      label: Text(
                        'Enter Your Height (in cm)',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      prefixIcon: Icon(Icons.height_outlined),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                    ),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 10,),
                  TextField(
                    controller: neckControlText,
                    decoration: InputDecoration(
                      label: Text(
                        'Enter Your Neck Measurement (in cm)',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      prefixIcon: Icon(Icons.person_remove),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                    ),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 10,),
                  TextField(
                    controller: waistControlText,
                    decoration: InputDecoration(
                      label: Text(
                        'Enter Your Waist Measurement (in cm)',
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                      prefixIcon: Icon(Icons.linear_scale_sharp),
                      border: myInputBorder(),
                      enabledBorder: myInputBorder(),
                    ),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Container(height: 10,),
                  Visibility(
                    visible: isShow,
                    child: TextField(
                      controller: hipControlText,
                      decoration: InputDecoration(
                        label: Text(
                          'Enter Your Hip Measurement (in cm)',
                          style: TextStyle(fontSize: 16, color: Colors.black38),
                        ),
                        prefixIcon: Icon(Icons.linear_scale_sharp),
                        border: myInputBorder(),
                        enabledBorder: myInputBorder(),
                      ),
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 20
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(height: 10,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      double mWidth = MediaQuery.of(context).size.width;
                      double mHeight = MediaQuery.of(context).size.height;

                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Container(
                                height: 750,
                                color: Colors.black26,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(height: 20,),
                                      Text(
                                        'RESULT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Container(height: 10,),
                                      Column(
                                        children: [
                                          Container(
                                            height: 350,
                                            width: 350,
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 3, color: Colors.black38),
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                    'Body Fat (U.S. Navy Method)'
                                                ),
                                                Text(
                                                    'Body Fat Category'
                                                ),
                                                Text(
                                                    'Body Fat Mass'
                                                ),
                                                Text(
                                                    'Lean Body Mass'
                                                ),
                                                Text(
                                                    'Ideal Body Fat for Given Age (Jackson & Pollard)'
                                                ),
                                                Text(
                                                    'Body Fat to Lose to Reach Ideal'
                                                ),
                                                Text(
                                                    'Body Fat (BMI method)'
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        child: const Text('Close'),
                                        onPressed: () => Navigator.pop(context),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                      });
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///Class for Daily Calories calculation
class DailyCaloriesCalculation extends StatelessWidget {
  const DailyCaloriesCalculation({super.key});

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
              'Daily Calories Calculation',
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

