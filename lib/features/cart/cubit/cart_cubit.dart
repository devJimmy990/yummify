import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yummify/features/cart/model/cart_item.dart';

class CartCubit extends HydratedCubit<List<CartItem>> {
  CartCubit() : super([]);

  void addItem(CartItem item) {
    final existingIndex = state.indexWhere((e) => e.id == item.id);

    if (existingIndex == -1) {
      emit([...state, item]);
    } else {
      final updatedCart = [...state];
      final existing = updatedCart[existingIndex];
      updatedCart[existingIndex] = existing.copyWith(
        quantity: existing.quantity + item.quantity,
      );
      emit(updatedCart);
    }
  }

  void removeItem(String id) =>
      emit(state.where((item) => item.id != id).toList());

  void updateQuantity(String id, int quantity) => emit(
    state.map((item) {
      if (item.id == id) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList(),
  );

  void clearCart() => emit([]);

  @override
  List<CartItem>? fromJson(Map<String, dynamic> json) {
    final items = json['cart'];
    if (items is List) {
      return items.map((e) => CartItem.fromJson(e)).toList();
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(List<CartItem> state) => {
    'cart': state.map((item) => item.toJson()).toList(),
  };
}
