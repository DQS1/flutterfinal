import 'package:flutter/material.dart';
import 'package:flutterfinal/screens/login/components/footer_screen.dart';
import 'package:flutterfinal/screens/login/components/header_screen.dart';
import 'package:flutterfinal/screens/login/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height, // Chiều cao của phần chứa hình ảnh
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/introduction.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderScreen(context),
                const LoginForm(),
                FooterScreen(context)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
