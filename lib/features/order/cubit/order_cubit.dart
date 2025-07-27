import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/features/order/cubit/order_state.dart';
import 'package:yummify/features/order/data/model/order.dart';
import 'package:yummify/features/order/data/repositories/order_repository.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._repository) : super(OrderInitial());
  final OrderRepository _repository;
  Future<void> getOrders(String userId) async {
    emit(OrderLoading());
    try {
      final orders = await _repository.getOrders(userId);
      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> createOrder(Order order) async {
    try {
      final currentState = state;

      if (currentState is OrderLoaded) {
        final existingOrders = currentState.orders;
        emit(OrderLoading());

        await _repository.createOrder(order.toJson());

        emit(OrderLoaded([...existingOrders, order]));
      } else {
        emit(OrderLoading());

        await _repository.createOrder(order.toJson());

        emit(OrderLoaded([order]));
      }
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> updateOrderStatus(String orderId, int status) async {
    try {
      await _repository.updateOrderStatus(orderId: orderId, status: status);
      emit(
        OrderLoaded(
          (state as OrderLoaded).orders.map((order) {
            if (order.id == orderId) {
              return order.copyWith(status);
            }
            return order;
          }).toList(),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
