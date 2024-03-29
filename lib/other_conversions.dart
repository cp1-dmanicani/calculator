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
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const Divider(
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
                          const RadialGaugeSegment(
                            minValue: 0,
                            maxValue: 18.5,
                            minAngle: -90,
                            maxAngle: -23,
                            color: Colors.blue,
                          ),
                          const RadialGaugeSegment(
                            minValue: 18.6,
                            maxValue: 24.9,
                            minAngle: -23,
                            maxAngle: 0,
                            color: Colors.green,
                          ),
                          const RadialGaugeSegment(
                            minValue: 25,
                            maxValue: 29.9,
                            minAngle: 0,
                            maxAngle: 18,
                            color: Colors.orange,
                          ),
                          const RadialGaugeSegment(
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Body Fat Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),

      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(5),
        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text(
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
                                const Text('Male',
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
                                const Text('Female',
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
                                        const Text(
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
                                            SizedBox(
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
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16,
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
                                                          'Body Fat Category : $bodyFatCategory',
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Body Fat Mass : ${fatMass.toStringAsFixed(2)} kg',
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Lean Body Mass : ${leanMass.toStringAsFixed(2)} kg',
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16,
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
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16,
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
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16,
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
                                        const SizedBox(height: 10,),
                                        ElevatedButton(
                                          onPressed: () => Navigator.pop(context),
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text('Close'),
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
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        genderVal = 0; //Male
                        ageControlText.clear();
                        weightControlText.clear();
                        heightControlText.clear();
                        neckControlText.clear();
                        waistControlText.clear();
                        hipControlText.clear();
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
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
  late String activityDropDownVal;
  double bmrFemale = 0.0;
  double bmrMale = 0.0;
  double bmrVal = 0.0;

  var ageControlText = TextEditingController();
  var weightControlText = TextEditingController();
  var heightControlText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'BMR Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text(
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
                                const Text('Male',
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
                                const Text('Female',
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
                          controller: weightControlText,
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
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: heightControlText,
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
                          controller: ageControlText,
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
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            enabledBorder: myInputBorder(),
                            focusedBorder: myInputBorder(),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                          items: <String>[
                            'BMR',
                            'Sedentary',
                            'Light',
                            'Moderate',
                            'Very Active',
                            'Extra Active'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,),
                                ),
                              ),
                            );
                          }).toList(),
                          hint: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                  'Activity',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black45,),
                              ),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              activityDropDownVal = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
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

                      int age = int.parse(mAge);
                      double weight = double.parse(mWeight);
                      double height = double.parse(mHeight);

                      bmrMale = 10 * weight + 6.25 * height - 5 * age + 5;
                      bmrFemale = 10 * weight + 6.25 * height - 5 * age - 161;

                      //If gender is female
                      if (genderVal==1) {
                        switch (activityDropDownVal) {
                          case 'BMR': bmrFemale = bmrFemale * 1; break;
                          case 'Sedentary': bmrFemale = bmrFemale * 1.2; break;
                          case 'Light': bmrFemale = bmrFemale * 1.375; break;
                          case 'Moderate': bmrFemale = bmrFemale * 1.55; break;
                          case 'Very Active': bmrFemale = bmrFemale * 1.725; break;
                          case 'Extra Active': bmrFemale = bmrFemale * 1.9; break;
                        }
                        bmrVal = bmrFemale;
                      }
                      //If gender is male
                      else {
                        switch (activityDropDownVal) {
                          case 'BMR': bmrMale = bmrMale * 1; break;
                          case 'Sedentary': bmrMale = bmrMale * 1.2; break;
                          case 'Light': bmrMale = bmrMale * 1.375; break;
                          case 'Moderate': bmrMale = bmrMale * 1.55; break;
                          case 'Very Active': bmrMale = bmrMale * 1.725; break;
                          case 'Extra Active': bmrMale = bmrMale * 1.9; break;
                        }
                        bmrVal = bmrMale;
                      }
                      setState(() {
                        bmrMale;
                        bmrFemale;
                        bmrVal;
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
                  SizedBox(height: 20,),
                  Text(
                    'Your Estimated Daily Calories : ${bmrVal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        genderVal = 0; //Female
                        ageControlText.clear();
                        weightControlText.clear();
                        heightControlText.clear();
                      });
                    },
                    child: const Text(
                    'Clear',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                    ),
                   ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• BMR (Basal Metabolic Rate)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '• Sedentary (little or no exercise)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '• Light (light exercise/sports 1-3 days/week)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '• Moderate (moderate exercise/sports 3-5 days/week)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '• Very Active (hard exercise/sports 6-7 days a week)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '• Extra Active (very hard exercise/sports & physical job or 2x training)',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                            fontSize: 12,
                          ),
                        ),
                      ],
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

class LengthConversion extends StatefulWidget {
  const LengthConversion({super.key});
  @override
  State<StatefulWidget> createState() => _LengthConversion();
}

///Class for Length conversions
class _LengthConversion extends State<LengthConversion> {
  TextEditingController firstConversion = TextEditingController();
  TextEditingController secondConversion = TextEditingController();

  var valA = '';
  double resultVal = 0.0;

  String convertFromVal = '';
  String convertedToVal = '';

  List<String> lengthItems = [
    'Kilometre',
    'Meter',
    'Centimeter',
    'Millimetre',
    'Micrometre',
    'Nanometre',
    'Mile',
    'Yard',
    'Foot',
    'Inch',
    'Nautical Mile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Length Conversion',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        child: Column(
                          children: [
                            const Text(
                              'Convert from :',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                              child: Container(
                                width: 150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),
                                  items: lengthItems.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Units',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,),
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      //Current value of the drop down button
                                      convertFromVal = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            TextField(
                              controller: firstConversion,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                label: const Center(
                                  child: Text(
                                    'Enter Value',
                                    style: TextStyle(fontSize: 16, color: Colors.black38),
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 20
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Column(
                    children: [
                      Container(
                        height: 200,
                          width: 350,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Convert to :',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                              child: Container(
                                width: 150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black45,
                                  ),
                                  items: lengthItems.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Units',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,),
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      //Current value of the drop down button
                                      convertedToVal = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 35,),
                            Text(
                              resultVal.toStringAsFixed(2),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      var lengthInput = firstConversion.text.toString();

                      String km = lengthItems[0];
                      String m = lengthItems[1];
                      String cm = lengthItems[2];
                      String mm = lengthItems[3];
                      String um = lengthItems[4];
                      String nm = lengthItems[5];
                      String mi = lengthItems[6];
                      String yard = lengthItems[7];
                      String ft = lengthItems[8];
                      String inch = lengthItems[9];
                      String nauticalMile = lengthItems[10];

                      if (lengthInput!='') {
                        var lengthInputVal = double.parse(lengthInput);

                        if (convertFromVal == convertedToVal) { resultVal = lengthInputVal * 1; }

                        ///From KM to other units
                        else if (convertFromVal==km && convertedToVal==m) { resultVal = lengthInputVal * 1000; }
                        else if (convertFromVal==km && convertedToVal==cm) { resultVal = lengthInputVal * 100000; }
                        else if (convertFromVal==km && convertedToVal==mm) { resultVal = lengthInputVal * 1e+6; }
                        else if (convertFromVal==km && convertedToVal==um) { resultVal = lengthInputVal * 1e+9; }
                        else if (convertFromVal==km && convertedToVal==nm) { resultVal = lengthInputVal * 1e+12; }
                        else if (convertFromVal==km && convertedToVal==mi) { resultVal = lengthInputVal/1.609; }
                        else if (convertFromVal==km && convertedToVal==yard) { resultVal = lengthInputVal * 1094; }
                        else if (convertFromVal==km && convertedToVal==ft) { resultVal = lengthInputVal * 3281; }
                        else if (convertFromVal==km && convertedToVal==inch) { resultVal = lengthInputVal * 39370; }
                        else if (convertFromVal==km && convertedToVal==nauticalMile) { resultVal = lengthInputVal/1.852; }
                        ///----------------------

                        ///From M to other units
                        else if (convertFromVal==m && convertedToVal==km) { resultVal = lengthInputVal/1000; }
                        else if (convertFromVal==m && convertedToVal==cm) { resultVal = lengthInputVal * 100; }
                        else if (convertFromVal==m && convertedToVal==mm) { resultVal = lengthInputVal * 1000; }
                        else if (convertFromVal==m && convertedToVal==um) { resultVal = lengthInputVal * 1e+6; }
                        else if (convertFromVal==m && convertedToVal==nm) { resultVal = lengthInputVal * 1e+9; }
                        else if (convertFromVal==m && convertedToVal==mi) { resultVal = lengthInputVal/1609; }
                        else if (convertFromVal==m && convertedToVal==yard) { resultVal = lengthInputVal * 1.094; }
                        else if (convertFromVal==m && convertedToVal==ft) { resultVal = lengthInputVal * 3.281; }
                        else if (convertFromVal==m && convertedToVal==inch) { resultVal = lengthInputVal * 39.37; }
                        else if (convertFromVal==m && convertedToVal==nauticalMile) { resultVal = lengthInputVal/1852; }
                        ///----------------------

                        ///From CM to other units
                        else if (convertFromVal==cm && convertedToVal==km) { resultVal = lengthInputVal/100000; }
                        else if (convertFromVal==cm && convertedToVal==m) { resultVal = lengthInputVal/100; }
                        else if (convertFromVal==cm && convertedToVal==mm) { resultVal = lengthInputVal * 10; }
                        else if (convertFromVal==cm && convertedToVal==um) { resultVal = lengthInputVal * 10000; }
                        else if (convertFromVal==cm && convertedToVal==nm) { resultVal = lengthInputVal * 1e+7; }
                        else if (convertFromVal==cm && convertedToVal==mi) { resultVal = lengthInputVal/160900; }
                        else if (convertFromVal==cm && convertedToVal==yard) { resultVal = lengthInputVal/91.44; }
                        else if (convertFromVal==cm && convertedToVal==ft) { resultVal = lengthInputVal/30.48; }
                        else if (convertFromVal==cm && convertedToVal==inch) { resultVal = lengthInputVal/2.54; }
                        else if (convertFromVal==cm && convertedToVal==nauticalMile) { resultVal = lengthInputVal/185200; }
                        ///----------------------

                        ///From MM to other units
                        else if (convertFromVal==mm && convertedToVal==km) { resultVal = lengthInputVal/1e+6; }
                        else if (convertFromVal==mm && convertedToVal==m) { resultVal = lengthInputVal/1000; }
                        else if (convertFromVal==mm && convertedToVal==cm) { resultVal = lengthInputVal/10; }
                        else if (convertFromVal==mm && convertedToVal==um) { resultVal = lengthInputVal * 1000; }
                        else if (convertFromVal==mm && convertedToVal==nm) { resultVal = lengthInputVal * 1e+6; }
                        else if (convertFromVal==mm && convertedToVal==mi) { resultVal = lengthInputVal/1.609e+6; }
                        else if (convertFromVal==mm && convertedToVal==yard) { resultVal = lengthInputVal/914.4; }
                        else if (convertFromVal==mm && convertedToVal==ft) { resultVal = lengthInputVal/304.8; }
                        else if (convertFromVal==mm && convertedToVal==inch) { resultVal = lengthInputVal/25.4; }
                        else if (convertFromVal==mm && convertedToVal==nauticalMile) { resultVal = lengthInputVal/1.852e+6; }
                        ///----------------------

                        ///From uM to other units
                        else if (convertFromVal==um && convertedToVal==km) { resultVal = lengthInputVal/1e+9; }
                        else if (convertFromVal==um && convertedToVal==m) { resultVal = lengthInputVal/1e+6; }
                        else if (convertFromVal==um && convertedToVal==cm) { resultVal = lengthInputVal/10000; }
                        else if (convertFromVal==um && convertedToVal==mm) { resultVal = lengthInputVal/1000; }
                        else if (convertFromVal==um && convertedToVal==nm) { resultVal = lengthInputVal * 1000; }
                        else if (convertFromVal==um && convertedToVal==mi) { resultVal = lengthInputVal/1.609e+9; }
                        else if (convertFromVal==um && convertedToVal==yard) { resultVal = lengthInputVal/914400; }
                        else if (convertFromVal==um && convertedToVal==ft) { resultVal = lengthInputVal/304800; }
                        else if (convertFromVal==um && convertedToVal==inch) { resultVal = lengthInputVal/25400; }
                        else if (convertFromVal==um && convertedToVal==nauticalMile) { resultVal = lengthInputVal/1.852e+9; }
                        ///----------------------

                        ///From NM to other units
                        else if (convertFromVal==nm && convertedToVal==km) { resultVal = lengthInputVal/1e+12; }
                        else if (convertFromVal==nm && convertedToVal==m) { resultVal = lengthInputVal/1e+9; }
                        else if (convertFromVal==nm && convertedToVal==cm) { resultVal = lengthInputVal/1e+7; }
                        else if (convertFromVal==nm && convertedToVal==mm) { resultVal = lengthInputVal/1e+6; }
                        else if (convertFromVal==nm && convertedToVal==um) { resultVal = lengthInputVal/1000; }
                        else if (convertFromVal==nm && convertedToVal==mi) { resultVal = lengthInputVal/1.609e+12; }
                        else if (convertFromVal==nm && convertedToVal==yard) { resultVal = lengthInputVal/9.144e+8; }
                        else if (convertFromVal==nm && convertedToVal==ft) { resultVal = lengthInputVal/3.048e+8; }
                        else if (convertFromVal==nm && convertedToVal==inch) { resultVal = lengthInputVal/2.54e+7; }
                        else if (convertFromVal==nm && convertedToVal==nauticalMile) { resultVal = lengthInputVal/1.852e+12; }
                        ///----------------------

                        ///From Mi to other units
                        else if (convertFromVal==mi && convertedToVal==km) { resultVal = lengthInputVal * 1.609; }
                        else if (convertFromVal==mi && convertedToVal==m) { resultVal = lengthInputVal * 1609; }
                        else if (convertFromVal==mi && convertedToVal==cm) { resultVal = lengthInputVal * 160900; }
                        else if (convertFromVal==mi && convertedToVal==mm) { resultVal = lengthInputVal * 1.609e+6; }
                        else if (convertFromVal==mi && convertedToVal==um) { resultVal = lengthInputVal * 1.609e+9; }
                        else if (convertFromVal==mi && convertedToVal==nm) { resultVal = lengthInputVal * 1.609e+12; }
                        else if (convertFromVal==mi && convertedToVal==yard) { resultVal = lengthInputVal * 1760; }
                        else if (convertFromVal==mi && convertedToVal==ft) { resultVal = lengthInputVal * 5280; }
                        else if (convertFromVal==mi && convertedToVal==inch) { resultVal = lengthInputVal * 63360; }
                        else if (convertFromVal==mi && convertedToVal==nauticalMile) { resultVal = lengthInputVal/1.151; }
                        ///----------------------

                        ///From Yd to other units
                        else if (convertFromVal==yard && convertedToVal==km) { resultVal = lengthInputVal/1094; }
                        else if (convertFromVal==yard && convertedToVal==m) { resultVal = lengthInputVal/1.094; }
                        else if (convertFromVal==yard && convertedToVal==cm) { resultVal = lengthInputVal * 91.44; }
                        else if (convertFromVal==yard && convertedToVal==mm) { resultVal = lengthInputVal * 914.4; }
                        else if (convertFromVal==yard && convertedToVal==um) { resultVal = lengthInputVal * 914400; }
                        else if (convertFromVal==yard && convertedToVal==nm) { resultVal = lengthInputVal * 9.144e+8; }
                        else if (convertFromVal==yard && convertedToVal==mi) { resultVal = lengthInputVal/1760; }
                        else if (convertFromVal==yard && convertedToVal==ft) { resultVal = lengthInputVal * 3; }
                        else if (convertFromVal==yard && convertedToVal==inch) { resultVal = lengthInputVal * 36; }
                        else if (convertFromVal==yard && convertedToVal==nauticalMile) { resultVal = lengthInputVal/2025; }
                        ///----------------------

                        ///From Ft to other units
                        else if (convertFromVal==ft && convertedToVal==km) { resultVal = lengthInputVal/3281; }
                        else if (convertFromVal==ft && convertedToVal==m) { resultVal = lengthInputVal/3.281; }
                        else if (convertFromVal==ft && convertedToVal==cm) { resultVal = lengthInputVal * 30.48; }
                        else if (convertFromVal==ft && convertedToVal==mm) { resultVal = lengthInputVal * 304.8; }
                        else if (convertFromVal==ft && convertedToVal==um) { resultVal = lengthInputVal * 304800; }
                        else if (convertFromVal==ft && convertedToVal==nm) { resultVal = lengthInputVal * 3.048e+8; }
                        else if (convertFromVal==ft && convertedToVal==mi) { resultVal = lengthInputVal/5280; }
                        else if (convertFromVal==ft && convertedToVal==yard) { resultVal = lengthInputVal/3; }
                        else if (convertFromVal==ft && convertedToVal==inch) { resultVal = lengthInputVal * 12; }
                        else if (convertFromVal==ft && convertedToVal==nauticalMile) { resultVal = lengthInputVal/6076; }
                        ///----------------------

                        ///From In to other units
                        else if (convertFromVal==inch && convertedToVal==km) { resultVal = lengthInputVal/39370; }
                        else if (convertFromVal==inch && convertedToVal==m) { resultVal = lengthInputVal/39.37; }
                        else if (convertFromVal==inch && convertedToVal==cm) { resultVal = lengthInputVal * 2.54; }
                        else if (convertFromVal==inch && convertedToVal==mm) { resultVal = lengthInputVal * 25.4; }
                        else if (convertFromVal==inch && convertedToVal==um) { resultVal = lengthInputVal * 25400; }
                        else if (convertFromVal==inch && convertedToVal==nm) { resultVal = lengthInputVal * 2.54e+7; }
                        else if (convertFromVal==inch && convertedToVal==mi) { resultVal = lengthInputVal/63360; }
                        else if (convertFromVal==inch && convertedToVal==yard) { resultVal = lengthInputVal/36; }
                        else if (convertFromVal==inch && convertedToVal==ft) { resultVal = lengthInputVal/12; }
                        else if (convertFromVal==inch && convertedToVal==nauticalMile) { resultVal = lengthInputVal/72910; }
                        ///----------------------

                        ///From Naut. Mile to other units
                        else if (convertFromVal==nauticalMile && convertedToVal==km) { resultVal = lengthInputVal * 1.852; }
                        else if (convertFromVal==nauticalMile && convertedToVal==m) { resultVal = lengthInputVal * 1852; }
                        else if (convertFromVal==nauticalMile && convertedToVal==cm) { resultVal = lengthInputVal * 185200; }
                        else if (convertFromVal==nauticalMile && convertedToVal==mm) { resultVal = lengthInputVal * 1.852e+6; }
                        else if (convertFromVal==nauticalMile && convertedToVal==um) { resultVal = lengthInputVal * 1.852e+9; }
                        else if (convertFromVal==nauticalMile && convertedToVal==nm) { resultVal = lengthInputVal * 1.852e+12; }
                        else if (convertFromVal==nauticalMile && convertedToVal==mi) { resultVal = lengthInputVal * 1.151; }
                        else if (convertFromVal==nauticalMile && convertedToVal==yard) { resultVal = lengthInputVal * 2025; }
                        else if (convertFromVal==nauticalMile && convertedToVal==ft) { resultVal = lengthInputVal * 6076; }
                        else if (convertFromVal==nauticalMile && convertedToVal==inch) { resultVal = lengthInputVal * 72910; }
                        ///----------------------

                        setState(() {
                          resultVal;
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
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstConversion.clear();
                        secondConversion.clear();
                        resultVal = 0.0;
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
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

class WeightConversion extends StatefulWidget {
  const WeightConversion({super.key});
  @override
  State<StatefulWidget> createState() => _WeightConv();
}

///Class for Weight conversions
class _WeightConv extends State<WeightConversion> {
  TextEditingController firstConversion = TextEditingController();
  TextEditingController secondConversion = TextEditingController();

  var valA = '';
  double resultVal = 0.0;

  String convertFromVal = '';
  String convertedToVal = '';

  List<String> weightItems = [
    'Tonne',
    'Kilogram',
    'Gram',
    'Milligram',
    'Microgram',
    'Imperial ton',
    'US ton',
    'Stone',
    'Pound',
    'Ounce',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Weight Conversion',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Convert from :',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                              child: Container(
                                width: 150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),
                                  items: weightItems.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Units',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,),
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      //Current value of the drop down button
                                      convertFromVal = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            TextField(
                              controller: firstConversion,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                label: const Center(
                                  child: Text(
                                    'Enter Value',
                                    style: TextStyle(fontSize: 16, color: Colors.black38),
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 20
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Convert to :',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                              child: Container(
                                width: 150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black45,
                                  ),
                                  items: weightItems.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Units',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,),
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      //Current value of the drop down button
                                      convertedToVal = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 35,),
                            Text(
                              resultVal.toStringAsFixed(2),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      var weightInput = firstConversion.text.toString();

                      String tonne = weightItems[0];
                      String kg = weightItems[1];
                      String g = weightItems[2];
                      String mg = weightItems[3];
                      String ug = weightItems[4];
                      String impTon = weightItems[5];
                      String usTon = weightItems[6];
                      String stone = weightItems[7];
                      String lb = weightItems[8];
                      String oz = weightItems[9];

                      if (weightInput!='') {
                        var weightInputVal = double.parse(weightInput);

                        if (convertFromVal == convertedToVal) { resultVal = weightInputVal * 1; }

                        ///From tonne to other units
                        else if (convertFromVal==tonne && convertedToVal==kg) { resultVal = weightInputVal * 1000; }
                        else if (convertFromVal==tonne && convertedToVal==g) { resultVal = weightInputVal * 1e+6; }
                        else if (convertFromVal==tonne && convertedToVal==mg) { resultVal = weightInputVal * 1e+9; }
                        else if (convertFromVal==tonne && convertedToVal==ug) { resultVal = weightInputVal * 1e+12; }
                        else if (convertFromVal==tonne && convertedToVal==impTon) { resultVal = weightInputVal/1.016; }
                        else if (convertFromVal==tonne && convertedToVal==usTon) { resultVal = weightInputVal * 1.102; }
                        else if (convertFromVal==tonne && convertedToVal==stone) { resultVal = weightInputVal * 157.5; }
                        else if (convertFromVal==tonne && convertedToVal==lb) { resultVal = weightInputVal * 2205; }
                        else if (convertFromVal==tonne && convertedToVal==oz) { resultVal = weightInputVal * 35270; }
                        ///----------------------

                        ///From kg to other units
                        else if (convertFromVal==kg && convertedToVal==tonne) { resultVal = weightInputVal/1000; }
                        else if (convertFromVal==kg && convertedToVal==g) { resultVal = weightInputVal * 1000; }
                        else if (convertFromVal==kg && convertedToVal==mg) { resultVal = weightInputVal * 1e+6; }
                        else if (convertFromVal==kg && convertedToVal==ug) { resultVal = weightInputVal * 1e+9; }
                        else if (convertFromVal==kg && convertedToVal==impTon) { resultVal = weightInputVal/1016; }
                        else if (convertFromVal==kg && convertedToVal==usTon) { resultVal = weightInputVal/907.2; }
                        else if (convertFromVal==kg && convertedToVal==stone) { resultVal = weightInputVal/6.35; }
                        else if (convertFromVal==kg && convertedToVal==lb) { resultVal = weightInputVal * 2.205; }
                        else if (convertFromVal==kg && convertedToVal==oz) { resultVal = weightInputVal * 35.274; }
                        ///----------------------

                        ///From gram to other units
                        else if (convertFromVal==g && convertedToVal==tonne) { resultVal = weightInputVal/1e+6; }
                        else if (convertFromVal==g && convertedToVal==kg) { resultVal = weightInputVal/1000; }
                        else if (convertFromVal==g && convertedToVal==mg) { resultVal = weightInputVal * 1000; }
                        else if (convertFromVal==g && convertedToVal==ug) { resultVal = weightInputVal * 1e+6; }
                        else if (convertFromVal==g && convertedToVal==impTon) { resultVal = weightInputVal/1.016e+6; }
                        else if (convertFromVal==g && convertedToVal==usTon) { resultVal = weightInputVal/907200; }
                        else if (convertFromVal==g && convertedToVal==stone) { resultVal = weightInputVal/6350; }
                        else if (convertFromVal==g && convertedToVal==lb) { resultVal = weightInputVal/453.6; }
                        else if (convertFromVal==g && convertedToVal==oz) { resultVal = weightInputVal/28.35; }
                        ///----------------------

                        ///From milligram to other units
                        else if (convertFromVal==mg && convertedToVal==tonne) { resultVal = weightInputVal/1e+9; }
                        else if (convertFromVal==mg && convertedToVal==kg) { resultVal = weightInputVal/1e+6; }
                        else if (convertFromVal==mg && convertedToVal==g) { resultVal = weightInputVal/1000; }
                        else if (convertFromVal==mg && convertedToVal==ug) { resultVal = weightInputVal * 1000; }
                        else if (convertFromVal==mg && convertedToVal==impTon) { resultVal = weightInputVal * 1.016e+9; }
                        else if (convertFromVal==mg && convertedToVal==usTon) { resultVal = weightInputVal/9.072e+8; }
                        else if (convertFromVal==mg && convertedToVal==stone) { resultVal = weightInputVal/6.35e+6; }
                        else if (convertFromVal==mg && convertedToVal==lb) { resultVal = weightInputVal/453600; }
                        else if (convertFromVal==mg && convertedToVal==oz) { resultVal = weightInputVal/28350; }
                        ///----------------------

                        ///From microgram to other units
                        else if (convertFromVal==ug && convertedToVal==tonne) { resultVal = weightInputVal/1e+12; }
                        else if (convertFromVal==ug && convertedToVal==kg) { resultVal = weightInputVal/1e+9; }
                        else if (convertFromVal==ug && convertedToVal==g) { resultVal = weightInputVal/1e+6; }
                        else if (convertFromVal==ug && convertedToVal==mg) { resultVal = weightInputVal/1000; }
                        else if (convertFromVal==ug && convertedToVal==impTon) { resultVal = weightInputVal/1.016e+12; }
                        else if (convertFromVal==ug && convertedToVal==usTon) { resultVal = weightInputVal/9.072e+11; }
                        else if (convertFromVal==ug && convertedToVal==stone) { resultVal = weightInputVal/6.35e+9; }
                        else if (convertFromVal==ug && convertedToVal==lb) { resultVal = weightInputVal/4.536e+8; }
                        else if (convertFromVal==ug && convertedToVal==oz) { resultVal = weightInputVal/2.835e+7; }
                        ///----------------------

                        ///From imperial ton to other units
                        else if (convertFromVal==impTon && convertedToVal==tonne) { resultVal = weightInputVal * 1.016; }
                        else if (convertFromVal==impTon && convertedToVal==kg) { resultVal = weightInputVal * 1016; }
                        else if (convertFromVal==impTon && convertedToVal==g) { resultVal = weightInputVal * 1.016e+6; }
                        else if (convertFromVal==impTon && convertedToVal==mg) { resultVal = weightInputVal * 1.016e+9; }
                        else if (convertFromVal==impTon && convertedToVal==ug) { resultVal = weightInputVal * 1.016e+12; }
                        else if (convertFromVal==impTon && convertedToVal==usTon) { resultVal = weightInputVal * 1.12; }
                        else if (convertFromVal==impTon && convertedToVal==stone) { resultVal = weightInputVal * 160; }
                        else if (convertFromVal==impTon && convertedToVal==lb) { resultVal = weightInputVal * 2240; }
                        else if (convertFromVal==impTon && convertedToVal==oz) { resultVal = weightInputVal * 35840; }
                        ///----------------------

                        ///From US ton to other units
                        else if (convertFromVal==usTon && convertedToVal==tonne) { resultVal = weightInputVal/1.102; }
                        else if (convertFromVal==usTon && convertedToVal==kg) { resultVal = weightInputVal * 907.2; }
                        else if (convertFromVal==usTon && convertedToVal==g) { resultVal = weightInputVal * 907200; }
                        else if (convertFromVal==usTon && convertedToVal==mg) { resultVal = weightInputVal * 9.072e+8; }
                        else if (convertFromVal==usTon && convertedToVal==ug) { resultVal = weightInputVal * 9.072e+11; }
                        else if (convertFromVal==usTon && convertedToVal==impTon) { resultVal = weightInputVal/1.12; }
                        else if (convertFromVal==usTon && convertedToVal==stone) { resultVal = weightInputVal * 142.9; }
                        else if (convertFromVal==usTon && convertedToVal==lb) { resultVal = weightInputVal * 2000; }
                        else if (convertFromVal==usTon && convertedToVal==oz) { resultVal = weightInputVal * 32000; }
                        ///----------------------

                        ///From stone to other units
                        else if (convertFromVal==stone && convertedToVal==tonne) { resultVal = weightInputVal/157.5; }
                        else if (convertFromVal==stone && convertedToVal==kg) { resultVal = weightInputVal * 6.35; }
                        else if (convertFromVal==stone && convertedToVal==g) { resultVal = weightInputVal * 6350; }
                        else if (convertFromVal==stone && convertedToVal==mg) { resultVal = weightInputVal * 6.35e+6; }
                        else if (convertFromVal==stone && convertedToVal==ug) { resultVal = weightInputVal * 6.35e+9; }
                        else if (convertFromVal==stone && convertedToVal==impTon) { resultVal = weightInputVal/160; }
                        else if (convertFromVal==stone && convertedToVal==usTon) { resultVal = weightInputVal/142.9; }
                        else if (convertFromVal==stone && convertedToVal==lb) { resultVal = weightInputVal * 14; }
                        else if (convertFromVal==stone && convertedToVal==oz) { resultVal = weightInputVal * 224; }
                        ///----------------------

                        ///From lbs to other units
                        else if (convertFromVal==lb && convertedToVal==tonne) { resultVal = weightInputVal/2205; }
                        else if (convertFromVal==lb && convertedToVal==kg) { resultVal = weightInputVal/2.205; }
                        else if (convertFromVal==lb && convertedToVal==g) { resultVal = weightInputVal * 453.6; }
                        else if (convertFromVal==lb && convertedToVal==mg) { resultVal = weightInputVal * 453600; }
                        else if (convertFromVal==lb && convertedToVal==ug) { resultVal = weightInputVal * 4.536e+8; }
                        else if (convertFromVal==lb && convertedToVal==impTon) { resultVal = weightInputVal/2240; }
                        else if (convertFromVal==lb && convertedToVal==usTon) { resultVal = weightInputVal/2000; }
                        else if (convertFromVal==lb && convertedToVal==stone) { resultVal = weightInputVal/14; }
                        else if (convertFromVal==lb && convertedToVal==oz) { resultVal = weightInputVal * 16; }
                        ///----------------------

                        ///From oz to other units
                        else if (convertFromVal==oz && convertedToVal==tonne) { resultVal = weightInputVal/35270; }
                        else if (convertFromVal==oz && convertedToVal==kg) { resultVal = weightInputVal/35.274; }
                        else if (convertFromVal==oz && convertedToVal==g) { resultVal = weightInputVal * 28.35; }
                        else if (convertFromVal==oz && convertedToVal==mg) { resultVal = weightInputVal * 28350; }
                        else if (convertFromVal==oz && convertedToVal==ug) { resultVal = weightInputVal * 2.835e+7; }
                        else if (convertFromVal==oz && convertedToVal==impTon) { resultVal = weightInputVal/35840; }
                        else if (convertFromVal==oz && convertedToVal==usTon) { resultVal = weightInputVal/32000; }
                        else if (convertFromVal==oz && convertedToVal==stone) { resultVal = weightInputVal/224; }
                        else if (convertFromVal==oz && convertedToVal==lb) { resultVal = weightInputVal/16; }
                        ///----------------------

                        setState(() {
                          resultVal;
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
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstConversion.clear();
                        secondConversion.clear();
                        resultVal = 0.0;
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
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

class TemperatureConv extends StatefulWidget {
  const TemperatureConv({super.key});
  @override
  State<StatefulWidget> createState() => _TemperatureConv();
}

///Class for Temperature conversions
class _TemperatureConv extends State<TemperatureConv> {
  TextEditingController firstConversion = TextEditingController();
  TextEditingController secondConversion = TextEditingController();

  var valA = '';
  double resultVal = 0.0;

  String convertFromVal = '';
  String convertedToVal = '';

  List<String> temperatureItems = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Temperature Conversion',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Convert from :',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                              child: Container(
                                width: 150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),
                                  items: temperatureItems.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Units',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,),
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      //Current value of the drop down button
                                      convertFromVal = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            TextField(
                              controller: firstConversion,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                label: const Center(
                                  child: Text(
                                    'Enter Value',
                                    style: TextStyle(fontSize: 16, color: Colors.black38),
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 20
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Convert to :',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                              child: Container(
                                width: 150,
                                height: 50,
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black45,
                                  ),
                                  items: temperatureItems.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Units',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black45,),
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      //Current value of the drop down button
                                      convertedToVal = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 35,),
                            Text(
                              resultVal.toStringAsFixed(2),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      var tempInput = firstConversion.text.toString();

                      String celsius = temperatureItems[0];
                      String fahrenheit = temperatureItems[1];
                      String kelvin = temperatureItems[2];

                      if (tempInput!='') {
                        var tempInputVal = double.parse(tempInput);

                        if (convertFromVal == convertedToVal) { resultVal = tempInputVal * 1; }

                        ///From celsius to other units
                        else if (convertFromVal==celsius && convertedToVal==fahrenheit) { resultVal = (tempInputVal*(9/5))+32; }
                        else if (convertFromVal==celsius && convertedToVal==kelvin) { resultVal = tempInputVal+273.15; }
                        ///----------------------

                        ///From fahrenheit to other units
                        else if (convertFromVal==fahrenheit && convertedToVal==celsius) { resultVal = (tempInputVal-32)*(5/9); }
                        else if (convertFromVal==fahrenheit && convertedToVal==kelvin) { resultVal = ((tempInputVal-32)*(5/9))+273.15; }
                        ///----------------------

                        ///From kelvin to other units
                        else if (convertFromVal==kelvin && convertedToVal==celsius) { resultVal = tempInputVal-273.15; }
                        else if (convertFromVal==kelvin && convertedToVal==fahrenheit) { resultVal = ((tempInputVal/-273.15)*(9/5))+32; }
                        ///----------------------

                        setState(() {
                          resultVal;
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
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstConversion.clear();
                        secondConversion.clear();
                        resultVal = 0.0;
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
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

///Class for Currency conversions
class CurrencyConv extends StatelessWidget {
  const CurrencyConv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Fiat Conversion Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Fiat to Crypto Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
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

