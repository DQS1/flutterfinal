import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/screens/cart/components/cart_item.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/product_popular/components/product_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/common_search_bar.dart';
import '../../../../search/search_screen.dart';

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
  Future<void> removeFavorite(int index) async {
    _favoriteProducts.removeAt(index);
    List<String> favoriteJsonList =
    _favoriteProducts.map((favorite) => jsonEncode(favorite.toMap())).toList();
    await _prefs.setStringList('favorite', favoriteJsonList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          // serachUI(),
          Expanded(
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
                          hotel: _favoriteProducts[index],
                        );
                      },
                    ),
                  )),
          )
        ],
      ),
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
