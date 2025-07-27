import 'package:yummify/features/order/data/data_sources/base_order_data_source.dart';
import 'package:yummify/features/order/data/model/order.dart';

class OrderRepository {
  OrderRepository(this._dataSource);
  final BaseOrderDataSource _dataSource;

  Future<void> createOrder(Map<String, dynamic> payload) async {
    try {
      await _dataSource.createOrder(payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Order>> getOrders(String userId) async {
    try {
      final data = await _dataSource.getOrders(userId);
      return data.map((order) => Order.fromJson(order)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateOrderStatus({
    required String orderId,
    required int status,
  }) async {
    try {
      await _dataSource.updateOrderStatus(orderId: orderId, status: status);
    } catch (e) {
      rethrow;
    }
  }
}
