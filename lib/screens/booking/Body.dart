import 'package:flutter/material.dart';
import 'package:flutterfinal/screens/booking/room_item.dart';
import 'package:flutterfinal/screens/cart/components/cart_item.dart';
import 'package:flutterfinal/screens/cart/components/check_out_cart.dart';

import 'package:flutterfinal/models/hotel.dart';
class Body1 extends StatefulWidget {
  final Hotel? hotel;

  const Body1({Key? key, this.hotel}) : super(key: key);

  @override
  State<Body1> createState() => _BodyState();
}

class _BodyState extends State<Body1> {
  // List<Hotel> cartDetail = Cart.getCart();
  double sum = 0.0;

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blue,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Booking"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.hotel!.rooms.length ?? 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                         RoomItem(
                          hotel: widget.hotel,
                      ),
                    ],
                  );
                },
              ),
            ),
            // CheckOutCart(sum: sum)
          ],
        ),
      ),
    );
  }
}
