import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart'; // Required for shimmer effect
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/features/shopping/data/model/category.dart';
import 'package:yummify/features/shopping/presentation/screens/category_meals.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.category, {super.key});
  final Category category;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      context.navigate(CategoryMeals(category.id));
    },
    child: Column(
      children: [
        CircleAvatar(
          radius: 45.r,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45.r),
            child: Image.network(
              category.img,
              width: 90.r,
              height: 90.r,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 90.r,
                    height: 90.r,
                    color: Colors.white,
                  ),
                );
              },
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.fastfood, size: 30),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.name,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
