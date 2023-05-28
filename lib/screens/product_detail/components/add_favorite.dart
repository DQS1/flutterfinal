import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterfinal/models/hotel.dart';
class AddProductToFavorite extends StatefulWidget {
  final Hotel hotel;

  const AddProductToFavorite({Key? key, required this.hotel})
      : super(key: key);

  @override
  State<AddProductToFavorite> createState() => _AddProductToFavoriteState();
}

class _AddProductToFavoriteState extends State<AddProductToFavorite> {
  late SharedPreferences _prefs;
  bool _isLiked = false;
  List<Products> _favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    _initIsLiked();
  }

  Future<void> _initIsLiked() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJsonList = _prefs.getStringList('favorite');
    if (favoriteJsonList != null) {
      List<Products> favoriteList = favoriteJsonList
          .map((json) => Products.fromMap(jsonDecode(json)))
          .toList();
      _isLiked = favoriteList.any((p) => p.id == widget.hotel.id);
    }
    setState(() {});
  }

  Future<void> _toggleIsLiked() async {
    setState(() {
      _isLiked = !_isLiked;
    });
    List<String> favoriteJsonList =
        _prefs.getStringList('favorite') ?? <String>[];
    List<Hotel> favoriteList = favoriteJsonList
        .map((json) => Hotel.fromMap(jsonDecode(json)))
        .toList();
    if (_isLiked) {
      favoriteList.add(widget.hotel);
    } else {
      favoriteList.removeWhere((p) => p.id == widget.hotel.id);
    }
    favoriteJsonList = favoriteList.map((p) => json.encode(p.toMap())).toList();
    await _prefs.setStringList('favorite', favoriteJsonList);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 80,top: 20),
      child: ElevatedButton(
        onPressed: () async{
          await _toggleIsLiked();

          Fluttertoast.showToast(
              msg: _isLiked ? "Đã thêm vào danh sách yêu thích" : 'Đã xoá khỏi danh sách yêu thích',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.orangeAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          !_isLiked ? Icon(Icons.favorite, color: Colors.white,size: 40,) :Icon(Icons.favorite, color: Colors.red,size: 40,) ,

          ],
        ),
      ),
    );
  }
}
