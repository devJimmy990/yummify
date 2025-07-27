import 'package:flutter/material.dart';
import 'package:yummify/app.dart';
import 'package:yummify/core/helper/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}
