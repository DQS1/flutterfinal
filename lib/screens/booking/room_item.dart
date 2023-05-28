import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import './roomlist.dart';
import 'package:flutterfinal/models/rooms.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';
class RoomItem extends StatefulWidget {
  final Hotel? hotel;

  const RoomItem({Key? key, this.hotel}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<RoomItem> {
  @override
  Widget build(BuildContext context) {
    // remove duplicate rooms
    final uniqueRooms = widget.hotel!.rooms.toSet().toList();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: uniqueRooms.length,
        itemBuilder: (context, index) {
          final room = uniqueRooms[index];
          return SizedBox(
     // provide a fixed height for the widget
            width: MediaQuery.of(context).size.width,
            child: RoomItem2(
              key: ObjectKey(room), // provide a unique key based on the room data
              room: room,
            ),
          );
        },
      ),
    );
  }
}