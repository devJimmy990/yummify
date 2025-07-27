import 'package:yummify/core/firebase/firebase.dart';
import 'package:yummify/features/order/data/data_sources/base_order_data_source.dart';

class RemoteOrderDataSource implements BaseOrderDataSource {
  RemoteOrderDataSource(this._firebase);
  final Firebase _firebase;
  @override
  Future<void> createOrder(Map<String, dynamic> payload) async {
    try {
      final ref = _firebase.store.collection("orders").doc(payload['id']);
      await ref.set(payload);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getOrders(String userId) {
    try {
      return _firebase.store
          .collection("orders")
          .where("userId", isEqualTo: userId)
          .get()
          .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required int status,
  }) {
    try {
      return _firebase.store.collection("orders").doc(orderId).update({
        "status": status,
      });
    } catch (e) {
      rethrow;
    }
  }
}
