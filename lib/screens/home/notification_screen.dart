import 'package:flutter/material.dart';
import 'package:flutterfinal/models/bookingmodel.dart';
import 'noti_services.dart';
import 'order_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<BookingModel> products = [];
  bool isLoading = false;
  final GetOrder getOrder = GetOrder();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    setState(() {
      isLoading = true;
    });
    try {
      products = await getOrder.getOrderList(context: context);
      setState(() {});
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return OrderItem(
              hotel: products[index],
            );
          },
        ),
      ),
    );
  }
}