abstract class BaseOrderDataSource {
  Future<void> createOrder(Map<String, dynamic> payload);
  Future<List<Map<String, dynamic>>> getOrders(String userId);
  Future<void> updateOrderStatus({
    required String orderId,
    required int status,
  });
}
