import 'package:flutter/material.dart';

import '../../../../../models/products.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({Key? key}) : super(key: key);

  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    var count=1;
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      // child: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: cartDetail.length,
      //         itemBuilder: (context, index) {
      //           return Column(
      //             children: [
      //               CartItemWithGestureDetector(
      //                 products: cartDetail[index],
      //                 onTap: () {
      //                   setState(() {
      //                     count=count+1;
      //                    );
      //                   });
      //                 },
      //               ),
      //               const Divider()
      //             ],
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class CartItemWithGestureDetector extends StatefulWidget {
  const CartItemWithGestureDetector({
    Key? key,
    required this.products,
    required this.onTap,
  }) : super(key: key);

  final Products products;
  final VoidCallback onTap;

  @override
  _CartItemWithGestureDetectorState createState() =>
      _CartItemWithGestureDetectorState();
}

class _CartItemWithGestureDetectorState
    extends State<CartItemWithGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // child: CartItem(
      //   products: widget.products,
      // ),
      onTap: widget.onTap,
    );
  }
}