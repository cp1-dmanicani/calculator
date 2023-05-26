import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'package:range_type/predefined_ranges.dart';

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
  var bodyFatCategory = '';

  double bodyFatPercentage = 0.0;
  double fatMass = 0.0;
  double leanMass = 0.0;
  double idealBodyFatForAge = 0.0;
  double bodyFatToLoseToReachIdeal = 0.0;
  double bmiMethod = 0.0;

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
                    'Body Fat Calculation',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                      'Your Gender',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
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
                      prefixIcon: Icon(Icons.numbers_rounded),
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
                        prefixIcon: Icon(Icons.accessibility_outlined),
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
                      var mAge = ageControlText.text.toString();
                      var mWeight = weightControlText.text.toString();
                      var mHeight = heightControlText.text.toString();
                      var mNeckMeasure = neckControlText.text.toString();
                      var mWaistMeasure = waistControlText.text.toString();
                      var mHipMeasure = hipControlText.text.toString();

                      int age = int.parse(mAge);
                      double weight = double.parse(mWeight);
                      double height = double.parse(mHeight);
                      double neck = double.parse(mNeckMeasure);
                      double waist = double.parse(mWaistMeasure);
                      double logBase(num x, num base) => log(x) / log(base);
                      var waistNeck = waist-neck;

                      if (mAge != '' && mWeight != '' && mHeight != '' && mNeckMeasure != '' && mWaistMeasure != '' || mHipMeasure != '') {
                        //If gender is female
                        if (genderVal == 1) {
                          double? hip = double.parse(mHipMeasure);
                          var waistHipNeck = waist+hip-neck;
                          try {
                            setState(() {
                              bodyFatPercentage = 495/((1.29579 - 0.35004*logBase(waistHipNeck, 10) + 0.22100*logBase(height, 10))) - 450;
                              fatMass = (bodyFatPercentage * weight)/100;
                              leanMass = weight - fatMass;
                            });

                            ///Conditions for determining the body fat category based on the body fat percentage result.
                            if (bodyFatPercentage >= 32.00) {bodyFatCategory = "Obese";}
                            else if (bodyFatPercentage >= 25.00) {bodyFatCategory = "Average";}
                            else if (bodyFatPercentage <= 20.00) {bodyFatCategory = "Athletes";}
                            else {bodyFatCategory = "Fitness";}

                            ///Conditions for determining the ideal body fat percentage based on age.
                            if (age >= 55) {idealBodyFatForAge = 26.3;}
                            else if (age >= 50) {idealBodyFatForAge = 25.2;}
                            else if (age >= 45) {idealBodyFatForAge = 22.9;}
                            else if (age >= 40) {idealBodyFatForAge = 22.2;}
                            else if (age >= 35) {idealBodyFatForAge = 21.5;}
                            else if (age >= 30) {idealBodyFatForAge = 19.3;}
                            else if (age >= 25) {idealBodyFatForAge = 18.4;}
                            else if (age >= 20) {idealBodyFatForAge = 17.7;}
                            else {idealBodyFatForAge = 17.7;}
                          }
                          on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),)));
                          }
                        }
                        //If gender is male
                        else {
                          try {
                            setState(() {
                              bodyFatPercentage = 495/((1.0324 - 0.19077*logBase(waistNeck, 10) + 0.15456*logBase(height, 10))) - 450;
                              fatMass = (bodyFatPercentage * weight)/100;
                              leanMass = weight - fatMass;
                            });

                            ///Conditions for determining the body fat category based on the body fat percentage result.
                            if (bodyFatPercentage >= 25.00) {bodyFatCategory = "Obese";}
                            else if (bodyFatPercentage >= 18.00) {bodyFatCategory = "Average";}
                            else if (bodyFatPercentage <= 13.99) {bodyFatCategory = "Athletes";}
                            else {bodyFatCategory = "Fitness";}

                            ///Conditions for determining the ideal body fat percentage based on age.
                            if (age >= 55) {idealBodyFatForAge = 20.9;}
                            else if (age >= 50) {idealBodyFatForAge = 18.9;}
                            else if (age >= 45) {idealBodyFatForAge = 16.4;}
                            else if (age >= 40) {idealBodyFatForAge = 15.3;}
                            else if (age >= 35) {idealBodyFatForAge = 13.7;}
                            else if (age >= 30) {idealBodyFatForAge = 12.7;}
                            else if (age >= 25) {idealBodyFatForAge = 10.5;}
                            else if (age >= 20) {idealBodyFatForAge = 8.5;}
                            else {idealBodyFatForAge = 8.5;}
                          }
                          on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),)));
                          }
                        }
                        ///Compute the body fat to lose to reach the ideal weight
                        ///based based on Jackson & Pollard Ideal Body Fat Percentages chart.
                        bodyFatToLoseToReachIdeal = ((bodyFatPercentage-idealBodyFatForAge)/100) * weight;
                        
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
                                              height: 300,
                                              width: 350,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Body Fat (U.S. Navy Method) : ${bodyFatPercentage.toStringAsFixed(2)}%',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Body Fat Category : ${bodyFatCategory}',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Body Fat Mass : ${fatMass.toStringAsFixed(2)} kg',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Lean Body Mass : ${leanMass.toStringAsFixed(2)} kg',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Ideal Body Fat for Given Age : ${idealBodyFatForAge.toStringAsFixed(2)}%',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Body Fat to Lose to Reach Ideal : ${bodyFatToLoseToReachIdeal.toStringAsFixed(2)} kg',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
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

                      } else {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all the fields to get a result.'),));
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BMRCalculation extends StatefulWidget {
  const BMRCalculation({super.key});
  @override
  State<StatefulWidget> createState() => _BMRCalculation();
}

///Class for Daily Calories calculation
class _BMRCalculation extends State<BMRCalculation> {
  int genderVal = 0;
  bool isShow = true;
  String activityDropDownVal = 'BMR';

  var ageControl = TextEditingController();
  var weightControl = TextEditingController();
  var heightControl = TextEditingController();
  var bodyFatValControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'BMR Calculation',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Your Gender',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
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
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: weightControl,
                          decoration: InputDecoration(
                            label: Text(
                              'Weight (kg)',
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
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: heightControl,
                          decoration: InputDecoration(
                            label: Text(
                              'Height (cm)',
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
                      ),
                    ],
                  ),
                  Container(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: ageControl,
                          decoration: InputDecoration(
                            label: Text(
                              'Age',
                              style: TextStyle(fontSize: 16, color: Colors.black38),
                            ),
                            prefixIcon: Icon(Icons.numbers_sharp),
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
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: myInputBorder(),
                            focusedBorder: myInputBorder(),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                          value: activityDropDownVal,
                          items: <String>[
                            'BMR',
                            'Sedentary',
                            'Light',
                            'Moderate',
                            'Active',
                            'Very Active',
                            'Extra Active'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              activityDropDownVal = newValue!;
                            });
                          },
                        ),
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

