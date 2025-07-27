import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/features/cart/presentation/screens/cart_screen.dart';
import 'package:yummify/features/main/cubit/main_cubit.dart';
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
                  Scaffold(body: Center(child: Text('Profile Screen'))),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: context.read<MainCubit>().changeIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
    ),
  );
}
