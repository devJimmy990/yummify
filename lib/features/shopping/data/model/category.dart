class Category {
  Category({required this.id, required this.name, required this.img});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'], name: json['name'], img: json['img']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'img': img};

  final String id, name, img;

  @override
  String toString() => 'Category{id: $id, name: $name, img: $img}';
}
