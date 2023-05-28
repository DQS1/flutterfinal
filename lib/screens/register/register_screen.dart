import 'package:flutter/material.dart';
import 'package:flutterfinal/screens/register/components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.blue,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      // body: const RegisterForm(),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  "Register Account",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      height: 1.5),
                ),
                Text(
                  "Complete your details or continue \n with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                RegisterForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
