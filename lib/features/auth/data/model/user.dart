class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    avatar: json['avatar'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'avatar': avatar,
  };

  User copyWith(Map<String, dynamic> json) => User(
    id: id,
    name: json['name'] ?? name,
    phone: json['phone'] ?? phone,
    email: json['email'] ?? email,
    avatar: json['avatar'] ?? avatar,
  );

  @override
  String toString() =>
      'User{name: $name, phone: $phone, email: $email, avatar: $avatar}';

  final String id, phone, email, name;
  final String? avatar;
}
