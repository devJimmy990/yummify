import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/features/shopping/cubit/category/category_cubit.dart';
import 'package:yummify/features/shopping/cubit/category/category_state.dart';
import 'package:yummify/features/shopping/presentation/widgets/category_card.dart';
import 'package:yummify/features/shopping/presentation/widgets/category_shimmer_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getCategories();
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return SizedBox(
            height: 125.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) => const CategoryShimmerCard(),
            ),
          );
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: 125.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder:
                  (context, index) => CategoryCard(state.categories[index]),
            ),
          );
        } else {
          return Center(
            child: Text(Localization.shoppingFailedToLoadCategories),
          );
        }
      },
    );
  }
}
