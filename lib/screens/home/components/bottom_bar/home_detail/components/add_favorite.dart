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
  List<Hotel> _favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    _initIsLiked();
  }

  Future<void> _initIsLiked() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJsonList = _prefs.getStringList('favorite');
    if (favoriteJsonList != null) {
      List<Hotel> favoriteList = favoriteJsonList
          .map((json) => Hotel.fromMap(jsonDecode(json)))
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
      height: 50,
      width: 200,
      margin: EdgeInsets.only(left: 100,top: 20),
      child: ElevatedButton(
        onPressed: () async{
          await _toggleIsLiked();
          Fluttertoast.showToast(
              msg: _isLiked ? "Add to Favourite" : '',
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
          backgroundColor: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.heart_broken, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Add to Favourite",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
