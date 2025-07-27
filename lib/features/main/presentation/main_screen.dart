import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/features/cart/presentation/screens/cart_screen.dart';
import 'package:yummify/features/main/cubit/main_cubit.dart';
import 'package:yummify/features/profile/screens/profile_screen.dart';
import 'package:yummify/features/shopping/presentation/screens/shopping_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => MainCubit(),
    child: BlocBuilder<MainCubit, int>(
      builder:
          (context, currentIndex) => Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: currentIndex,
                children: const [
                  ShoppingScreen(),
                  CartScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: context.read<MainCubit>().changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: Localization.mainHome,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  label: Localization.mainCart,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: Localization.mainProfile,
                ),
              ],
            ),
          ),
    ),
  );
}
