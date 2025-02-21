import 'dart:convert';

class User {
  String? id;
  String address;
  String email;
  String name;
  String phone;
  String photo;
  
  User({
    this.id,
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.photo,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] ?? '',  // Afegir valor per defecte en cas que sigui null
        address: json["address"] ?? '',  // Comprovació per a camps nuls
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        photo: json["photo"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "address": address,
        "email": email,
        "name": name,
        "phone": phone,
        "photo": photo,
      };

  User copy() => User(
        id: id,
        address: address,
        email: email,
        name: name,
        phone: phone,
        photo: photo,
      );

  User copyWith({
    String? id,
    String? address,
    String? email,
    String? name,
    String? phone,
    String? photo,
  }) {
    return User(
      id: id ?? this.id,
      address: address ?? this.address,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
    );
  }
}
