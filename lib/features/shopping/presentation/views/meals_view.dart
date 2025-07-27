import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_cubit.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_state.dart';
import 'package:yummify/features/shopping/presentation/widgets/meal_card.dart';
import 'package:yummify/features/shopping/presentation/widgets/meal_shimmer_card.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MealCubit>().getMeals();

    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoading) {
          return SliverList(
            delegate: SliverChildListDelegate.fixed([
              const _MealHeader(),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                padding: EdgeInsets.only(top: 12.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio:
                      MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.7),
                ),
                itemBuilder: (context, index) => const MealShimmerCard(),
              ),
            ]),
          );
        } else if (state is MealError) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                'Error: ${state.error}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else if (state is MealLoaded) {
          final meals =
              state.popularMeals.length > 10
                  ? state.popularMeals.sublist(0, 10)
                  : state.popularMeals;

          return SliverList(
            delegate: SliverChildListDelegate.fixed([
              const _MealHeader(),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: meals.length,
                padding: EdgeInsets.only(top: 12.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio:
                      MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.7),
                ),
                itemBuilder: (context, index) => MealCard(meals[index]),
              ),
            ]),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

class _MealHeader extends StatelessWidget {
  const _MealHeader();

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(top: 12.h, left: 4.w, right: 4.w, bottom: 8.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '🍽️ Popular Meals',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () => context.namedNavigator(Routes.allMeals),
          child: const Text('See All'),
        ),
      ],
    ),
  );
}
