import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/features/shopping/presentation/views/categories_view.dart';
import 'package:yummify/features/shopping/presentation/views/meals_view.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        slivers: [
          if (_searchController.text.isEmpty) ...[
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            const SliverToBoxAdapter(child: CategoriesView()),
          ],

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: const MealsView(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    ),
  );
}
