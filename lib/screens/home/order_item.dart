import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterfinal/models/bookingmodel.dart';
import 'package:flutterfinal/screens/order_detail/order_detail.dart';
import 'package:intl/intl.dart';
import 'services_cancel.dart';

class OrderItem extends StatefulWidget {
  final BookingModel hotel;

  const OrderItem({Key? key, required this.hotel}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  Future<bool> _showCancelConfirmationDialog() {
    Completer<bool> completer = Completer<bool>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Huỷ đặt phòng?'),
          content: Text('Bạn có chắc muốn huỷ đặt phòng không?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng dialog
                completer.complete(false); // Trả về giá trị false
              },
              child: Text('Không'),
            ),
            TextButton(
              onPressed: () {
                // Thực hiện hành động huỷ đặt phòng ở đây
                Navigator.pop(context); // Đóng dialog
                completer.complete(true); // Trả về giá trị true
              },
              child: Text('Có'),
            ),
          ],
        );
      },
    );

    return completer.future;
  }

  final CancelService cancelService = CancelService();

  @override
  Widget build(BuildContext context) {
    // String formattedNumber = NumberFormat('#,##0', 'vi_VN').format(widget.hotel.price);
    String formattedNumber = NumberFormat('#,##0', 'vi_VN')
        .format(double.parse('${widget.hotel.price}'));
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, ProductDetailScreen.routeName,
                  //     arguments:
                  //     ProductDetailsArguments(hotel: widget.hotel));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetail(
                        book: widget.hotel,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://agotourist.com/wp-content/uploads/2020/10/khach-san-minh-chien-da-lat-1.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          '${widget.hotel.guestEmail}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.hotel.roomType}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Khách sạn ${widget.hotel.status}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 5),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Giá: ${formattedNumber}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        widget.hotel.status == "cancelled"
            ? Positioned(
                top: 50,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút "Huỷ"
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text('Đã hủy '),
                ),
              )
            : Positioned(
                top: 50,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {

                    cancelService.CanCelOrder(
                        context: context,
                        id: widget.hotel.id,
                        status: "cancelled");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Hủy đặt '),
                ),
              ),
      ],
    );
  }
}
