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
              'Other Conversions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 3,
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Scientific'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Scientific()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.monitor_weight),
            title: const Text('BMI'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMI()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.height),
            title: const Text('Length'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LengthConv()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.scale),
            title: const Text('Weight'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeightConv()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.severe_cold),
            title: const Text('Temperature'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TemperatureConv()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Fiat (Currency)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CurrencyConv()),
              );
            },
          ),
          ListTile(
            title: const Text('Cryptocurrency'),
            leading: const Icon(Icons.currency_bitcoin),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FiatToCryptoConv()),
              );
            },
          ),
        ],
      ),
    );
  }

  ///END
  ///----------------------------------------------------
}