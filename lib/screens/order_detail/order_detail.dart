import 'package:flutter/material.dart';
import 'package:flutterfinal/models/bookingmodel.dart';

import 'package:intl/intl.dart';

class OrderDetail extends StatefulWidget {
  final BookingModel book;
  const OrderDetail({Key? key, required this.book}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    String formattedNumber = NumberFormat('#,##0', 'vi_VN').format(double.parse('${widget.book.price}'));

    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10),
              foregroundDecoration: const BoxDecoration(color: Colors.black26),
              height: 400,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(' ${widget.book.roomType}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child:  Text(
                        "id: ${widget.book.id}",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    const Spacer(),



                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('Email: ${widget.book.guestEmail}',style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Expanded(
                            child: Text('Tên  ${widget.book.guestName}',style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          // Column(
                          //   children:  <Widget>[
                          //     Text(
                          //       "\$ ${widget.book.price}",
                          //       style: TextStyle(
                          //           color: Colors.purple,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 20.0),
                          //     ),
                          //
                          //   ],
                          // )
                        ],
                      ),
                      const SizedBox(height: 30.0),

                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Status: ${widget.book.status}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23.0),
                      ),
                      Text(
                        "Giá tiền phòng:  \$ ${formattedNumber}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),


                    ],

                  ),

                ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),

        ],
      ),
    );;
  }
}
