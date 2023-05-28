import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/product_popular/services/product_service.dart';

import '../../../../../../../models/products.dart';
import 'components/product_item.dart';

class ProductPopular extends StatefulWidget {
  const ProductPopular({Key? key}) : super(key: key);

  @override
  State<ProductPopular> createState() => _ProductPopularState();
}

class _ProductPopularState extends State<ProductPopular> {
  List<Hotel> hotels =[];
  final HoetlService hoetlService = HoetlService();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    hotels = await hoetlService.hotelPopular(context: context);
    print(hotels);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: const [
              Expanded(child: Text("Danh sách khách sạn", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),)),
              Text("See more", style: TextStyle(fontSize: 16, color: Colors.lightBlue),),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: hotels!.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  hotel:hotels[index],
                );
              } ,
            ),
          )
        ],
      ),
    );
  }
}
