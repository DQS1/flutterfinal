import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterfinal/constants/error_handling.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/models/categories.dart';
import 'package:http/http.dart' as http;


class CategoriesService {
  String uri = Utils.url;

  Future<List<Categories>> categoriesStore({
    required BuildContext context,
  }) async {
    List<Categories> categoriesList = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            categoriesList.add(
              Categories.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
    return categoriesList;
  }
}
