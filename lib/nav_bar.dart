import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/other_conversions.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(35),
        children: [
          const ListTile(
            title: Text(
              'Other Calculators',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Scientific'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => Scientific(),
                ),
              );
            },
          ),
          const Divider(thickness: 1,),
          ListTile(
            leading: const Icon(Icons.monitor_weight),
            title: const Text('BMI'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => BMI(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_3),
            title: const Text('Body Fat'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => BodyFatCalculation(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('BMR (Basal Metabolic Rate)'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => BMRCalculation(),
                ),
              );
            },
          ),
          const Divider(thickness: 1,),
          ListTile(
            leading: const Icon(Icons.height),
            title: const Text('Length'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => LengthConversion(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.scale),
            title: const Text('Weight'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => WeightConversion(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.severe_cold),
            title: const Text('Temperature'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => TemperatureConv(),
                ),
              );
            },
          ),
          const Divider(thickness: 1,),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Fiat (Currency)'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => CurrencyConv(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Cryptocurrency'),
            leading: const Icon(Icons.currency_bitcoin),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => FiatToCryptoConv(),
                ),
              );
            },
          ),
          const Divider(thickness: 1,),
        ],
      ),
    );
  }

  ///END
  ///----------------------------------------------------
}