import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yummify/features/cart/cubit/cart_cubit.dart';
import 'package:yummify/features/cart/model/cart_item.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({required this.item, super.key});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.network(
              item.img,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    color: Colors.white,
                  ),
                );
              },
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.fastfood, size: 30),
            ),
          ),
          SizedBox(width: 12.w),

          // Item Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 4.h),
                Text('\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                SizedBox(height: 4.h),
                Text(
                  'Total: \$${(item.price * item.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Actions
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (item.quantity > 1) {
                        cubit.updateQuantity(item.id, item.quantity - 1);
                      } else {
                        cubit.removeItem(item.id);
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(item.quantity.toString()),
                  IconButton(
                    onPressed: () {
                      cubit.updateQuantity(item.id, item.quantity + 1);
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => cubit.removeItem(item.id),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
