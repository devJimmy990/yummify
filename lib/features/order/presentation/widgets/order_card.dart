import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yummify/features/order/data/model/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(this.order, {super.key});

  final Order order;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: const Icon(Icons.receipt_long_rounded),
      title: Text('Order #${order.id}'),
      subtitle: Text(
        '${order.items.length} items • ${DateFormat.yMMMd().format(order.date)}',
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${order.total.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            order.status.name,
            style: TextStyle(
              fontSize: 12,
              color: order.status == 'Delivered' ? Colors.green : Colors.orange,
            ),
          ),
        ],
      ),
    ),
  );
}
