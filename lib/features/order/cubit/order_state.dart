import 'package:yummify/features/order/data/model/order.dart';

sealed class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  OrderLoaded(this.orders, {this.isUpdated = false});
  final List<Order> orders;
  final bool isUpdated;
}

class OrderError extends OrderState {
  OrderError(this.error);
  final String error;
}
