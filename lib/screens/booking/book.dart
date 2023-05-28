import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';

import './Body.dart';

class BookScreen extends StatelessWidget {
  static const String routeName = "/book";
  const BookScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as RoomsDetailsArguments;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(Icons.arrow_back_ios),
      //   ),
      //   title: const Text("Booking Room Details",),
      // ),
      body: const Body1(),
    );
  }
}

class RoomsDetailsArguments {
  final Hotel hotel;
  RoomsDetailsArguments({required this.hotel});
}
