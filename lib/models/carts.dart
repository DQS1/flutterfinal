import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'products.dart';

class Cart {
  static List<Products> cart = [];

  static Future<void> addProductToCart(Products product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // cart.add(product);
    bool productExistsInCart = false;
    for (int i = 0; i < cart.length; i++) {
      if (cart[i].id == product.id) {
        cart[i].quantity++;
        productExistsInCart = true;
        break;
      }
    }
    if (!productExistsInCart) {
      cart.add(product);
    }
    List<String> cartJsonList =
        cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
    print(cartJsonList);

    await saveCart();
    await loadCart();
  }
  static Future<void> RemoveProductToCart(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // cart.remove(products);
    cart.removeAt(index);
      // ((element) => element.title==products.title);
    List<String> cartJsonList =
    cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
    print(cartJsonList);

    await saveCart();
  }
  //
  static Future<void> saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJsonList =
    cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
  }
  static List<Products> getCart() {
    return cart;
  }

  static Future<List<Map<String, dynamic>>> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');

    if (cartJson != null) {
      cart =
          cartJson.map((json) => Products.fromMap(jsonDecode(json))).toList();
      return cartJson
          .map((json) => jsonDecode(json) as Map<String, dynamic>)
          .toList();
    } else {
      return []; // Return a default value for cart
    }
  }
}
