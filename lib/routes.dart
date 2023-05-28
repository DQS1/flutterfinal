

import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/screens/booking/book.dart';
import 'package:flutterfinal/screens/cart/cart_screen.dart';
import 'package:flutterfinal/screens/home/home_screen.dart';
import 'package:flutterfinal/screens/login/login_screen.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';
import 'package:flutterfinal/screens/register/register_screen.dart';
import 'package:flutterfinal/screens/search/search_screen.dart';
import 'package:flutterfinal/screens/splash/splash_screen.dart';
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  SearchScreen.routeName:(context) => const SearchScreen(),
  // BookScreen.routeName:(context,{RouteSettings? route}){
  //   var room=route?.arguments as Hotel;
  //   return BookScreen(hotel: room,);
  //
  // },
  BookScreen.routeName:(context)=>const BookScreen(),
};
