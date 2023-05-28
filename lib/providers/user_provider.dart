import 'package:flutter/material.dart';
import 'package:flutterfinal/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user =
  User(id: '',
      name: '',
      email: '',
      password: '',
    customerPoints:1,
      // token: '',
     );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
    }
}
