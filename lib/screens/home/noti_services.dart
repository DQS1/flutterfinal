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
// class GetOrder {
//   String uri = Utils.url;
//
//   void getOrderItem({
//     required BuildContext context,
//   }) async {
//
//   }
//
//   final userId = Provider.of<UserProvider>(context,listen: false).user.id;
//     final username = Provider.of<UserProvider>(context,listen: false).user.username;
//     try {
// /*      Order order = Order(
//           userId: userId,
//         username:username,
//           orderDetails:orderDetails,
//           );*/
//       // print(order.orderDetails);
//       http.Response res = await http.get(
//         Uri.parse('$uri/api/order/getone/$userId'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Access-Control-Allow-Origin': '*',
//           'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
//           'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
//         },
//       );
//       print(res.body);
//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () async {
//           for (int i = 0; i < jsonDecode(res.body).length; i++) {
//             productList.add(
//               Products.fromJson(
//                 jsonEncode(
//                   jsonDecode(res.body)[i],
//                 ),
//               ),
//             );
//           }
//       );
//     } catch (e) {
//       Utils.showSnackBar(context, e.toString());
//       print(e);
//     }
//   }
// }
class GetOrder {
  String uri = Utils.url;

  Future<List<BookingModel>> getOrderList({
    required BuildContext context,
  }) async {
    List<BookingModel> booking = [];
    final username = Provider.of<UserProvider>(context,listen: false).user.name;
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/booking/$username'),
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
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            booking.add(
              BookingModel.fromJson(
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
    return booking;
  }
}