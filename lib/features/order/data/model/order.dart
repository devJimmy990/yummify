import 'package:yummify/features/cart/model/cart_item.dart';

enum OrderStatus { processing, completed, cancelled }

class Order {
  Order({
    required this.id,
    required this.date,
    required this.total,
    required this.items,
    required this.userId,
    OrderStatus? status,
  }) : status = status ?? OrderStatus.processing;

  Order.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      total = json['total'],
      userId = json['userId'],
      date = DateTime.parse(json['date']),
      status = OrderStatus.values[json['status']],
      items =
          (json['items'] as List)
              .map((item) => CartItem.fromJson(item))
              .toList();

  Order copyWith(int status) => Order(
    id: id,
    total: total,
    userId: userId,
    status: OrderStatus.values[status],
    date: date,
    items: items,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'total': total,
    'userId': userId,
    'status': status.index,
    'date': date.toIso8601String(),
    'items': items.map((item) => item.toJson()).toList(),
  };

  final double total;
  final DateTime date;
  final String id, userId;
  final OrderStatus status;
  final List<CartItem> items;
}
