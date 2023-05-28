import 'dart:convert';

class Products {
  String id;
  String title;
  String? description;
  String? image;
  num price;
  num quantity;


  Products(
      {required this.id,
      required this.title,
       this.description,
       this.image,
      required this.price,
      required this.quantity});


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      '_id': id,
      'quantity':quantity
    };
  }

    factory Products.fromMap(Map<String, dynamic> map) {
      return Products(
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        image: map['image'] ?? '',
        price: map['price'] ?? 0.0,
        id: map['_id'] ?? '',
        quantity:map['quantity'] ?? 1,
       );
    }

    String toJson() => json.encode(toMap());

    factory Products.fromJson(String source) =>
        Products.fromMap(json.decode(source));
}
