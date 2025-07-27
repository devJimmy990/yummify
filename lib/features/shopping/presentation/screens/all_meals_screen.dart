import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_cubit.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_state.dart';
import 'package:yummify/features/shopping/presentation/widgets/meal_card.dart';
import 'package:yummify/features/shopping/presentation/widgets/meal_shimmer_card.dart';

class AllMealsScreen extends StatelessWidget {
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(Localization.shoppingAllMeals)),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) {
          if (state is MealLoading) {
            return GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                childAspectRatio:
                    MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.7),
              ),
              itemBuilder: (_, __) => const MealShimmerCard(),
            );
          } else if (state is MealError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          } else if (state is MealLoaded) {
            return GridView.builder(
              itemCount: state.meals.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                childAspectRatio:
                    MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.7),
              ),
              itemBuilder: (context, index) => MealCard(state.meals[index]),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    ),
  );
}
