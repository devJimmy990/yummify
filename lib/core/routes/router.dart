import 'package:flutter/material.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/features/auth/presentation/screens/login_screen.dart';
import 'package:yummify/features/auth/presentation/screens/register_screen.dart';
import 'package:yummify/features/main/presentation/main_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  Routes.main: (context) => const MainScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.register: (context) => const RegistrationScreen(),
};
