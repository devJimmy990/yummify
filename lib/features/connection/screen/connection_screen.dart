import 'package:flutter/material.dart';
import 'package:yummify/core/localization/localization.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.red.shade50,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, size: 60, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            Localization.noConnection,
            style: const TextStyle(fontSize: 20, color: Colors.red),
          ),
        ],
      ),
    ),
  );
}
