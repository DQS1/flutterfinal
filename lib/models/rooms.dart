import 'dart:convert';

class Room {
  String roomName;
  num? price;
  num quantity;
  String id;
  String imageRoom;
  // List<dynamic> amenities;
  Room(
      {
required this.id,
        required this.roomName,
        required this.price,
       required this.quantity,
        required this.imageRoom,
        // required this.amenities,

      });


  Map<String, dynamic> toMap() {
    return {
      'roomName': roomName,
      'price': price,
      'quantity': quantity,
      '_id': id,
      'imageRoom':imageRoom,

    };
  }
  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      roomName: map['roomName'] ?? '',
      price: map['price'] ?? 0.0,
      quantity:map['quantity'] ?? 1,
      id: map['_id'] ?? '',
        imageRoom:map['imageRoom'] ?? ''

    );
  }

  String toJson() => json.encode(toMap());


  factory Room.fromJson(String source) =>
      Room.fromMap(json.decode(source));
}
