import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/providers/user_provider.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/account_detail/account_detail_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfinal/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final _accountFormKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  final AccountDetailService accountDetailService = AccountDetailService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  Uint8List? _image;
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }


  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  void updateInfomation() {
    accountDetailService.updateInfo(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }


  @override
  Widget build(BuildContext context) {
    final String rank;
    final email = Provider.of<UserProvider>(context, listen: false).user.email;
    final name = Provider.of<UserProvider>(context, listen: false).user.name;

    final point =
        Provider.of<UserProvider>(context, listen: false).user.customerPoints;


    return Form(
      child: Form(
        key: _accountFormKey,
        child: Padding(
          padding: const EdgeInsets.all(10.10),
          child: Column(
            children: [


              Text(
                'Tên khách Hàng : ${name}' ?? '',
                style: GoogleFonts.notoSansJavanese(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                'Gmail : ${name}' ?? '',
                style: GoogleFonts.notoSansJavanese(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                point! <= 30 ? "Rank: Đồng"  : point! > 30 &&  point! <= 100  ? " Rank : Vàng" : point! > 100 &&  point! <= 200 ? " Rank : Bạch kim" :point! > 200  ? " Rank : Kim cương" : "" ,
                style: GoogleFonts.notoSansJavanese(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              emailTextFormField(),
              const SizedBox(
                height: 10,
              ),
              passwordTextFormField(),
              const SizedBox(
                height: 10,
              ),
              confirmTextFormField(),
              Padding(
                padding: const EdgeInsets.all(30.10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {
                          updateInfomation();


                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Lưu thông tin",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0), // Thêm margin giữa các SizedBox
                    SizedBox(
                      height: 50,
                      width: 10,
                      child: Container(
                        height: 0,
                        width: 0,
                        color: Colors.white,
                      ),
                      // Nút thứ hai
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.routeName, (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    final email = Provider.of<UserProvider>(context, listen: false).user.name;

    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
        hintText: "Enter your Gmail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined),
      ),
      validator: Utils.validateEmail,
      onSaved: (value) {
        setState(() {
          _emailController.text = value!;
        });
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      controller: _passwordController,
      obscureText: true,

      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      validator: (passwordKey) {
        return Utils.validatePassword(passwordKey!);
      },
    );
  }

  TextFormField confirmTextFormField() {
    return TextFormField(
      controller: _confirmController,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          labelText: 'Re-enter Password',
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      validator: (confirmPassword) {
        var pass = _passKey.currentState!.value;
        return Utils.confirmPassword(confirmPassword!, pass);
      },
      onSaved: (value) {
        setState(() {
          _confirmController.text = value!;
        });
      },
    );
  }
}
