import 'package:yummify/features/shopping/data/model/meal.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'] as String,
    img: json['img'] as String,
    name: json['name'] as String,
    price: json['price'] as double,
    quantity: json['quantity'] as int,
  );
  factory CartItem.fromMeal(Meal meal, {int quantity = 1}) => CartItem(
    id: meal.id,
    img: meal.img,
    name: meal.name,
    price: meal.price,
    quantity: quantity,
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'img': img,
    'name': name,
    'price': price,
    'quantity': quantity,
  };
  CartItem copyWith({int? quantity}) => CartItem(
    id: id,
    img: img,
    name: name,
    price: price,
    quantity: quantity ?? this.quantity,
  );

  final String id, name, img;
  final double price;
  final int quantity;

  @override
  String toString() =>
      'CartItem{id: $id, name: $name, price: $price, quantity: $quantity}';
}
