import 'package:flutter/material.dart';
import 'package:flutterfinal/constants/error_handling.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/models/carts.dart';
import 'package:flutterfinal/models/order.dart';
import 'package:flutterfinal/providers/user_provider.dart';
import 'package:flutterfinal/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
class LoginService {
  String uri = Utils.url;

  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/user/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },

      );
      if(res != 200){
        Utils.showSnackBar(context, "Login không thành công");
      }
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          // NavigationServices(context).gotoBottomTabScreen();
          Utils.showSnackBar(context, "Login Success");
        },
      );

    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
