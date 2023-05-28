import 'dart:convert';
import 'rooms.dart';
class Hotel {
  String id;
  String name;
  String address;
  String description;
  String image_url;
  String price_range;
  num? star;
  // List<dynamic> amenities;
  List<Map<String, dynamic>> rooms;
  Hotel(
      {required this.id,
        required this.name,
       required this.description,
       required this.image_url,
        required this.price_range,
        required this.address,
        this.star,
       // required this.amenities,
        required this.rooms

      });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'star': star,
      'description': description,
      'image_url': image_url,
      'price_range': price_range,
      '_id': id,

    'rooms':  rooms
          ?.map((x) => {
        'roomName': x['roomName'] ?? "rooms",
        'price': x['price'] ?? 0.0,
        'quantity': x['quantity'] ?? 1,
      'imageRoom':x['imageRoom'] ?? ''

    })
          .toList()
    };
  }
  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image_url: map['image_url'] ?? '',
      price_range: map['price_range'] ?? 0.0,
      id: map['_id'] ?? '',
      star: map['star'] ?? 3,

      address: map['address'] ??'',
      rooms: List<Map<String, dynamic>>.from(map['rooms']?.map((x) => {
        'roomName': x['roomName'] ?? '',
        'quantity': x['quantity'] ?? 1,
        'price': x['price'] ?? 0,
        'imageRoom':x['imageRoom'] ?? ''

      })) ,      // amenities: map['amenities'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());


  factory Hotel.fromJson(String source) =>
      Hotel.fromMap(json.decode(source));
}
