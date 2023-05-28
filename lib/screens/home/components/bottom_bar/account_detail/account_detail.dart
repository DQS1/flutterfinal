import 'package:flutter/material.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/providers/user_provider.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/account_detail/account_detail_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfinal/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

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
      username: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String rank;
    final email = Provider.of<UserProvider>(context, listen: false).user.email;
    final point = Provider.of<UserProvider>(context, listen: false).user.customerPoints;

    return Form(
      child: Form(
        key: _accountFormKey,
        child: Padding(
          padding: const EdgeInsets.all(10.10),
          child: Column(
            children: [
              Text(email ?? ''),
              Text(point! > 40 ? "Vàng" : "Đồng"),

              const SizedBox(
                height: 30,
              ),
              emailTextFormField(),
              const SizedBox(
                height: 30,
              ),
              passwordTextFormField(),
              const SizedBox(
                height: 30,
              ),
              confirmTextFormField(),

             Padding(
             padding:const EdgeInsets.all(30.10) ,
               child:  Row(

                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(
                     height: 50,
                     width: 150,
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
                     height: 30,
                   ),
                   SizedBox(
                     height: 50,
                     width: 150,
                     child: ElevatedButton(
                       onPressed: () {
                         Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
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

              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/google-icon.svg"),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/twitter.svg"),
                    ),
                  ],
                ),
              )
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
        border: OutlineInputBorder(),
        hintText: "Enter your Name",
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
