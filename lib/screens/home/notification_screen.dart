import 'package:flutter/material.dart';
import 'package:flutterfinal/models/bookingmodel.dart';
import '../../widgets/common_card.dart';
import '../../widgets/common_search_bar.dart';
import '../search/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          : ListView(
        children: [
          // serachUI(),
          Container(
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
        ],
      )
    );
  }

  Widget serachUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: CommonCard(
        radius: 36,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(38)),
          onTap: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
          child: CommonSearchBar(
            iconData: FontAwesomeIcons.search,
            enabled: false,
            text: "where are you going",
          ),
        ),
      ),
    );
  }
}