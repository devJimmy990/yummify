import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/order/cubit/order_cubit.dart';
import 'package:yummify/features/order/cubit/order_state.dart';
import 'package:yummify/features/order/presentation/widgets/order_card.dart';
import 'package:yummify/features/order/presentation/widgets/order_shimmer_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().getOrders(
      context.read<AuthCubit>().currentUser!.id,
    );
    return Scaffold(
      appBar: AppBar(title: Text(Localization.profileMyOrders)),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => const OrderShimmerCard(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            );
          } else if (state is OrderLoaded) {
            return ListView.separated(
              itemCount: state.orders.length,
              itemBuilder: (context, index) => OrderCard(state.orders[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            );
          }

          return Center(
            child: Text(Localization.shoppingFailedToLoadCategories),
          );
        },
      ),
    );
  }
}
