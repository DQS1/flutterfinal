import 'dart:convert';

class User {
  final String id;
  final String? name;
  final String? password;
  final String? email;
  final num? customerPoints;

  // List<Map<String, dynamic>>? bookings;

  User(
      {required this.id,
         this.name,
         this.password,
         this.email,
        this.customerPoints,
       });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'customerPoints':customerPoints
      // 'bookings': bookings != null
      //     ? bookings
      //     ?.map((x) => {
      //   'productId': x['productId'] ?? "id",
      //   'title': x['title'] ?? "",
      //   'price': x['price'] ?? 0.0,
      // })
      //     .toList()
      //     : [],
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] ?? '',
        name: map['name'] ?? '',
        password: map['password'] ?? '',
      customerPoints:map['customerPoints'] ?? 1,
        email: map['email'] ?? '',);

        // bookings: map['bookings'] ?? []);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

// User copyWith({
//   String? id,
//   String? username,
//   String? password,
// }) {
//   return User(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       password: password ?? this.password,
//       email: email ?? this.email,
//       bookings: bookings ?? []);
// }
}
