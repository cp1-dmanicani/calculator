import 'package:flutter/material.dart';

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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Scientific'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.monitor_weight),
            title: const Text('BMI'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.height),
            title: const Text('Length'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.scale),
            title: const Text('Weight'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.severe_cold),
            title: const Text('Temperature'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Fiat (Currency)'),
            onTap: () => null,
          ),
          ListTile(
            title: const Text('Cryptocurrency'),
            leading: const Icon(Icons.currency_bitcoin),
            onTap: () => null,
          ),
        ],
      ),
    );
  }

  ///END
  ///----------------------------------------------------
}