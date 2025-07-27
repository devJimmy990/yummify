import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/core/ui/toast.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/cart/cubit/cart_cubit.dart';
import 'package:yummify/features/cart/model/cart_item.dart';
import 'package:yummify/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:yummify/features/order/cubit/order_cubit.dart';
import 'package:yummify/features/order/data/model/order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isUserAuthenticated = context.read<AuthCubit>().isAuthenticated;
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.cartMyCart),
        actions: [
          TextButton(
            child: Text(
              Localization.generalClear,
              style: const TextStyle(color: Colors.red),
            ),

            onPressed: () {
              context.read<CartCubit>().clearCart();
            },
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return Center(child: Text(Localization.cartYourCartIsEmpty));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: cart.length,
                  padding: EdgeInsets.all(16.w),
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder:
                      (context, index) => CartItemCard(item: cart[index]),
                ),
              ),

              // Checkout Button
              Padding(
                padding: EdgeInsets.all(16.w),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (!isUserAuthenticated) {
                      showDialog(
                        context: context,
                        builder: (_) => const _AuthenticationDialog(),
                      );
                    } else {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const _CheckoutBottomSheet(),
                      );
                    }
                  },
                  icon: const Icon(Icons.payment),
                  label: Text(Localization.cartProceedToCheckout),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48.h),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CheckoutBottomSheet extends StatelessWidget {
  const _CheckoutBottomSheet();

  @override
  Widget build(BuildContext context) {
    final total = context.read<CartCubit>().state.fold<double>(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Confirm Checkout',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 12.h),
          Text('${Localization.orderTotalPrice} \$${total.toStringAsFixed(2)}'),
          SizedBox(height: 20.h),
          ElevatedButton.icon(
            icon: const Icon(Icons.check_circle),
            label: Text(Localization.generalConfirm),
            onPressed: () {
              Navigator.pop(context);
              context.read<OrderCubit>().createOrder(
                Order(
                  total: total,
                  date: DateTime.now(),
                  items: context.read<CartCubit>().state,
                  userId: context.read<AuthCubit>().currentUser!.id,
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                ),
              );
              context.read<CartCubit>().clearCart();
              ToastHelper.success(Localization.cartOrderCreatedSuccessfully);

              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('Checkout complete!')),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class _AuthenticationDialog extends StatelessWidget {
  const _AuthenticationDialog();

  @override
  Widget build(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
    contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
    title: Column(
      children: [
        const Icon(Icons.lock_outline, size: 48, color: Colors.deepOrange),
        const SizedBox(height: 16),
        Text(
          Localization.authAuthenticationRequired,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    content: Text(
      Localization.authPleaseLogInToContinueWithCheckout,
      textAlign: TextAlign.center,
    ),
    actionsAlignment: MainAxisAlignment.spaceBetween,
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(Localization.generalCancel),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          context.namedNavigator(Routes.login);
        },
        child: Text(Localization.authLogIn),
      ),
    ],
  );
}
