import 'package:flutter/material.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/providers/user_provider.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/account_detail/account_detail_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfinal/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final point =
        Provider.of<UserProvider>(context, listen: false).user.customerPoints;

    return Form(
      child: Form(
        key: _accountFormKey,
        child: Padding(
          padding: const EdgeInsets.all(10.10),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/11/26/00/14/woman-1063100_1280.jpg'),
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.blue,
                          ),
                          child: GestureDetector(
                            onTap: () => {
                            Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.routeName, (route) => false)
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Text(
                email ?? '',
                style: GoogleFonts.notoSansJavanese(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                point! > 40 ? "Rank: Vàng" : "Rank: Đồng",
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
