class Meal {
  Meal({
    required this.id,
    required this.img,
    required this.name,
    required this.rate,
    required this.price,
    required this.reviews,
    required this.category,
    required this.description,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    id: json['id'],
    img: json['img'],
    name: json['name'],
    description: json['desc'],
    category: json['categoryId'],
    reviews: json['reviewsCount'] ?? 0,
    rate: double.tryParse(json['rating'].toString()) ?? 0.0,
    price: double.tryParse(json['price'].toString()) ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'img': img,
    'name': name,
    'rate': rate,
    'price': price,
    'reviews': reviews,
    'category': category,
    'description': description,
  };

  final String id, name, category, img, description;
  final double price, rate;
  final int reviews;

  @override
  String toString() =>
      'Meal{id: $id, name: $name, img: $img, rate: $rate, price: $price, reviews: $reviews, category: $category, description: $description}';
}
