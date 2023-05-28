import 'package:flutter/material.dart';
import 'package:flutterfinal/models/carts.dart';
import 'package:flutterfinal/screens/cart/components/cart_item.dart';
import 'package:flutterfinal/screens/cart/components/check_out_cart.dart';

import '../../models/products.dart';
import 'package:flutterfinal/models/hotel.dart';
class Body extends StatefulWidget {
 final List<Hotel>?hotel;

  const Body({Key? key, this.hotel}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Products> cartDetail = Cart.getCart();
  double sum = 0.0;

  @override
  void initState() {
    super.initState();
    Cart.loadCart().then((cartJson) {
      setState(() {
        cartDetail = cartJson.map((json) => Products.fromMap(json)).toList();
        for (var element in cartDetail) {
          sum = sum + element.price;
        }
      });
    });
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
      title: const Text("Khách sạn }"),
    ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.hotel!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: CartItem(
                          hotel: widget.hotel![index],
                        ),
                        onTap: () {
                          setState(
                            () {
                              Cart.RemoveProductToCart(index);
                              Cart.loadCart();
                              Cart.saveCart();
                              cartDetail.removeAt(index);
                              sum = 0.0;
                              cartDetail.forEach((element) {
                                sum = sum + element.price;
                              });
                            },
                          );
                        },
                      ),
                      const Divider()
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
