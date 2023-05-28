import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/screens/product_detail/body.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs = ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   leading: GestureDetector(
      //     onTap: (){
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(Icons.arrow_back_ios),
      //   ),
      //   title: const Text("Details"),
      // ),
      body: Body(hotel: agrs.hotel),
    );
  }
}

class ProductDetailsArguments {
  final Hotel hotel;

  ProductDetailsArguments({required this.hotel});
}
