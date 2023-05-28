import 'package:flutter/cupertino.dart';
import 'package:flutterfinal/constants/error_handling.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'dart:convert';

class RegisterService {
  String uri = Utils.url;

  void registerUser({
    required BuildContext context,
    required String email,
    required String name,

    required String password,
  }) async {
    try {

      http.Response res = await http.post(
        Uri.parse('$uri/user/register'),
        body: jsonEncode({
          'email': email,
          'password': password,
          'name':name

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
        onSuccess: () {
          Utils.showSnackBar(
            context,
            'Đăng kí thành công',
          );
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
