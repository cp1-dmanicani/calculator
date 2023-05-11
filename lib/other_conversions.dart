import 'package:flutter/material.dart';

///Class for Scientific calculations
class Scientific extends StatelessWidget {
  const Scientific({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Scientific Calculator',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.science,
              color: Colors.white,
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

///Class for BMI calculations
class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d2630),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.monitor_weight,
              color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.height,
              color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.scale,
              color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.severe_cold,
              color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.money,
              color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.currency_bitcoin,
              color: Colors.white,
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


