import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/ui/toast.dart';
import 'package:yummify/features/cart/cubit/cart_cubit.dart';
import 'package:yummify/features/cart/model/cart_item.dart';
import 'package:yummify/features/shopping/data/model/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(this.meal, {super.key});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.img,
                width: double.infinity,
                height: 240.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text('${meal.rate.toStringAsFixed(1)} (${meal.reviews})'),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    meal.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 24.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatefulBuilder(
                        builder:
                            (context, setState) => Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() => quantity--);
                                    }
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                Text(
                                  quantity.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() => quantity++);
                                  },
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                      ),
                      Text(
                        '\$${(meal.price * quantity).toStringAsFixed(2)}',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: Colors.green),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<CartCubit>().addItem(
                          CartItem.fromMeal(meal, quantity: quantity),
                        );
                        ToastHelper.success(
                          Localization.shoppingItemAddedToCart,
                        );
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      label: Text(Localization.shoppingAddToCart),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
