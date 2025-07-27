import 'package:flutter/material.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/features/auth/presentation/screens/login_screen.dart';
import 'package:yummify/features/auth/presentation/screens/register_screen.dart';
import 'package:yummify/features/main/presentation/main_screen.dart';
import 'package:yummify/features/shopping/presentation/screens/all_meals_screen.dart';
import 'package:yummify/features/shopping/presentation/screens/shopping_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  Routes.main: (context) => const MainScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.shopping: (context) => const ShoppingScreen(),
  Routes.allMeals: (context) => const AllMealsScreen(),
  Routes.register: (context) => const RegistrationScreen(),
};
