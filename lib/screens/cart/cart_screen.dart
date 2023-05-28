import 'package:flutter/material.dart';
import 'package:flutterfinal/screens/cart/body.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Cart Details",),
      ),
      body: const Body(),
    );
  }
}
