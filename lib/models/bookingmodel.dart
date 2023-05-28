import 'dart:convert';

class BookingModel {
  final String guestName;
  final String guestEmail;
  final String checkInDate;
  final String checkOutDate;
  final String price;
  final String roomType;
  final String status;
  final String id;

  final num quantity;
  final num? point;



  BookingModel({
    required this.id,
    required this.guestName,
    required this.guestEmail,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.roomType,
    required this.status,
    required this.quantity,
    this.point,

  });

  Map<String, dynamic> toMap() => {
    'id':id,
    'guestName':guestName,
    'guestEmail':guestEmail,
    'checkInDate':checkInDate,
    'checkOutDate':checkOutDate,
    'price':price,
    'roomType':roomType,
    'status':status,
    'quantity':quantity,
    'point':point,
  };

  factory BookingModel.fromMap(Map<String, dynamic> json) {
    return BookingModel(
      id:json['_id'],
      guestName: json['guestName'],
      guestEmail: json['guestEmail'],
      checkInDate: json['checkInDate'],
      checkOutDate: json['checkOutDate'],
      price: json['price'],
      roomType: json['roomType'],
      status: json['status'],
        quantity:json['quantity'],
        point:json['point'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) => BookingModel.fromMap(json.decode(source));
}
