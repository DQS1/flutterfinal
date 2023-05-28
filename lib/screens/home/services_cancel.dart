import 'package:flutter/material.dart';
import 'package:flutterfinal/constants/error_handling.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/models/bookingmodel.dart';
import 'package:flutterfinal/models/carts.dart';
import 'package:flutterfinal/models/order.dart';
import 'package:flutterfinal/providers/user_provider.dart';
import 'package:flutterfinal/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'notification_screen.dart';

class CancelService {
  String uri = Utils.url;

  void CanCelOrder({
    required BuildContext context,
    required String id,
    required String status,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/booking/${id}'),
        body: jsonEncode({
          '_id': id,
          'status': status,
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
          Utils.showSnackBar(context, "Huỷ thành công Success");
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
