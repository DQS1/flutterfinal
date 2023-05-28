import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/screens/cart/components/cart_item.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/product_popular/components/product_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteDetail extends StatefulWidget {
  const FavoriteDetail({Key? key}) : super(key: key);

  @override
  State<FavoriteDetail> createState() => _FavoriteDetailState();
}

class _FavoriteDetailState extends State<FavoriteDetail> {
  late SharedPreferences _prefs;
  List<Hotel> _favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJsonList = _prefs.getStringList('favorite');
    if (favoriteJsonList != null) {
      _favoriteProducts = favoriteJsonList
          .map((json) => Hotel.fromMap(jsonDecode(json)))
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _favoriteProducts.isEmpty
          ? Center(child: Text('No favorites yet'))
          : Container(
        child: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemCount: _favoriteProducts!.length,
            itemBuilder: (context, index) {
              return ProductItem(
                hotel:_favoriteProducts[index],
              );
            } ,
          ),
        )
      ),
    );
  }
}
