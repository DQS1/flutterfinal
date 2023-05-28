// import 'package:flutter/material.dart';
// import 'package:flutterfinal/models/carts.dart';
// import 'package:flutterfinal/screens/cart/components/custom_text_field.dart';
// import 'package:flutterfinal/screens/cart/components/custom_bottom_modal.dart';
// import 'package:flutterfinal/screens/cart/services/fill_form_service.dart';
// import 'package:flutterfinal/providers/user_provider.dart';
// import 'package:provider/provider.dart';
//
// class CheckOutCart extends StatefulWidget {
//   final double sum;
//   final int count=1;
//
//   const CheckOutCart({Key? key, required this.sum}) : super(key: key);
//
//   @override
//   State<CheckOutCart> createState() => _CheckOutCartState();
// }
//
// class _CheckOutCartState extends State<CheckOutCart> {
//
//   final _checkOutFormKey = GlobalKey<FormState>();
//   final LoginService fillFormService = LoginService();
//
//   @override
//   void dispose() {
//     super.dispose();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final username = Provider.of<UserProvider>(context,listen: false).user.name;
//     void fillFormUser() async {
//       List<Map<String, dynamic>> cart = await Cart.loadCart(); // use await to wait for the result of the future
//       List<Map<String, dynamic>> updatedCart = cart.map((product) {
//         return {
//           '_id': product["_id"],
//           'title': product['title'],
//           'price': product['price'],
//           'quantity':product['quantity']
//         };
//       }).toList();
//
//       print(updatedCart);
//       fillFormService.loginUser(
//           context: context,
//           email:username,
//           orderDetails: updatedCart);
//     }
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//
//         Expanded(
//           child: SizedBox(
//             height: 50, // set the height here
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0.0),
//                   side: const BorderSide(color: Colors.green),
//                 ),
//                 backgroundColor: Colors.white,
//                 textStyle: const TextStyle(color: Colors.white),
//               ),
//               onPressed: () {},
//               child: Text(
//                 "Sum: ${widget.sum}",
//                 style: const TextStyle(fontSize: 14.0),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: SizedBox(
//             height: 50, // set the height here
//             child: TextButton(
//               onPressed: (){
//                 fillFormUser();
//               },
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0.0),
//                   side: const BorderSide(color: Colors.green),
//                 ),
//                 backgroundColor: Colors.green,
//                 textStyle: const TextStyle(color: Colors.white),
//               ),
//
//               child: Text(
//                 "Check out".toUpperCase(),
//                 style: const TextStyle(fontSize: 14, color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
