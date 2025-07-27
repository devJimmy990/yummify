import 'package:flutter/material.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/features/auth/presentation/screens/login_screen.dart';
import 'package:yummify/features/auth/presentation/screens/register_screen.dart';
import 'package:yummify/features/main/presentation/main_screen.dart';
import 'package:yummify/features/order/presentation/screens/orders_screen.dart';
import 'package:yummify/features/profile/screens/contact_us_screen.dart';
import 'package:yummify/features/settings/presentation/settings_screen.dart';
import 'package:yummify/features/shopping/presentation/screens/all_meals_screen.dart';
import 'package:yummify/features/shopping/presentation/screens/shopping_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  Routes.main: (context) => const MainScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.orders: (context) => const OrdersScreen(),
  Routes.shopping: (context) => const ShoppingScreen(),
  Routes.allMeals: (context) => const AllMealsScreen(),
  Routes.contact: (context) => const ContactUsScreen(),
  Routes.settings: (context) => const SettingsScreen(),
  Routes.register: (context) => const RegistrationScreen(),
};
