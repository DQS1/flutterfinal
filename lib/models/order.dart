import 'dart:convert';

class Order {
  final String userId;
  List<Map<String, dynamic>> orderDetails;
  final String username;


  Order({
    required this.userId,
    required this.orderDetails,
    required this.username,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'username':username,
        'orderDetails': orderDetails
            .map((x) => [{
                  '_id': x['_id'] ?? "id",
                  'title': x['title'] ?? "",
                  'price': x['price'] ?? 0.0,
          'quantity':x['quantity'] ?? 1

        }])
            .toList(),

      };

  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
      userId: json['userId'],
      username: json['username'],
      orderDetails: List<Map<String, dynamic>>.from(json['orderDetails']?.map((x) => [{
            '_id': x['_id'] ?? '',
            'title': x['title'],
            'price': x['price'],
          }])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
