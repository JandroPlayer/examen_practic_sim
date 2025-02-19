class User {
  final String id;
  final String address;
  final String email;
  final String name;
  final String phone;
  final String photo;

  User({
    required this.id,
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.photo,
  });

  // Deserialitzar JSON a objecte User
  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
      id: id,
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  // Serialitzar objecte User a JSON
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'email': email,
      'name': name,
      'phone': phone,
      'photo': photo,
    };
  }
}
