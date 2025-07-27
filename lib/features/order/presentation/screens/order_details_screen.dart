import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yummify/features/cart/model/cart_item.dart';
import 'package:yummify/features/order/cubit/order_cubit.dart';
import 'package:yummify/features/order/data/model/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({required this.order, super.key});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final isProcessing = order.status == OrderStatus.processing;

    return Scaffold(
      appBar: AppBar(title: Text('Order #${order.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildOrderSummary(order),
            const SizedBox(height: 16),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Order Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildCartItems(order.items)),
            if (isProcessing) _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(Order order) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _infoRow("Order Date", DateFormat.yMMMd().format(order.date)),
      _infoRow("Total Items", "${order.items.length}"),
      _infoRow("Total Price", "\$${order.total.toStringAsFixed(2)}"),
      _infoRow(
        "Status",
        order.status.name,
        valueColor:
            order.status == OrderStatus.completed
                ? Colors.green
                : order.status == OrderStatus.cancelled
                ? Colors.red
                : Colors.orange,
      ),
    ],
  );

  Widget _infoRow(String title, String value, {Color? valueColor}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: valueColor)),
      ],
    ),
  );

  Widget _buildCartItems(List<CartItem> items) => ListView.separated(
    itemCount: items.length,
    separatorBuilder: (_, __) => const Divider(),
    itemBuilder: (context, index) {
      final item = items[index];
      return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.img,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item.name),
        subtitle: Text('\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
        trailing: Text(
          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      );
    },
  );

  Widget _buildActionButtons(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: () {
            context.read<OrderCubit>().updateOrderStatus(
              order.id,
              OrderStatus.cancelled.index,
            );
            Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel, color: Colors.red),
          label: const Text('Cancel'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            context.read<OrderCubit>().updateOrderStatus(
              order.id,
              OrderStatus.completed.index,
            );
            Navigator.pop(context);
          },
          icon: const Icon(Icons.check_circle),
          label: const Text('Mark as Complete'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
      ],
    ),
  );
}
