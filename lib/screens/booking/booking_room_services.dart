import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterfinal/constants/error_handling.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/models/categories.dart';
import 'package:flutterfinal/models/rooms.dart';
import 'package:http/http.dart' as http;
import 'package:flutterfinal/screens/home/home_screen.dart';

import 'package:flutterfinal/screens/home/home_screen.dart';
class BookingRoomService {
  String uri = Utils.url;

  void Booking({
    required BuildContext context,
    required String userId,
    required String guestName,
    required String guestEmail,
    required String checkInDate,
    required String checkOutDate,
    required String price,
    required String roomType,
    required String status,
    required num quantity,
    required num point,
    required String hotelName,
    // required String userID,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/booking'),
        body: jsonEncode({
          'guestName': guestName,
          'guestEmail': guestEmail,
          'checkInDate': checkInDate,
          'checkOutDate': checkOutDate,
          'price': price,
          'roomType': roomType,
          'status': status,
          'quantity':quantity,
          'point':point,
          'hotelName':hotelName
          // 'userID':userID

        }),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },

      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
                (route) => false,
          );
          Utils.showSnackBar(context, "Đặt phòng thành côngg");
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
