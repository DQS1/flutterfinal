import 'package:flutter/material.dart';
import 'package:flutterfinal/constants/utils.dart';
import 'package:flutterfinal/models/user.dart';
import 'package:flutterfinal/providers/user_provider.dart';
import 'package:flutterfinal/screens/home/home_screen.dart';
import 'package:flutterfinal/screens/login/login_service.dart';
import 'package:flutterfinal/screens/register/register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  bool _value = false;
  late SharedPreferences prefs;
  final LoginService loginService = LoginService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
    _getData();
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<GoogleSignInAccount?> _signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      print(account);
      return account;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    loginService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void _getData() async {
    prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");
    if (username != null && username.isNotEmpty) {
      _emailController.text = username;
      _passwordController.text = prefs.getString("password")!;
      _value = prefs.getBool('check') ?? false;
      print(_value.toString());
    }
  }
  //
  void navigateToHomeScreen() {
    // if (_loginFormKey.currentState!.validate()) {
      signInUser();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user.name;
    print(user);
    return Form(
      key: _loginFormKey,

      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Travel Now",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign in with your email and password \nor continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(

                      validator: (value) {
                        return Utils.validateEmail(value!);
                      },
                      onSaved: (_value) {
                        setState(() {
                          _emailController.text = _value!;
                        });
                      },
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    const SizedBox(
                      height: 7,

                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20,

                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        return Utils.validatePassword(value!);
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    // Row(
                    //   children: [
                    //     Checkbox(value: _value??:true, onChanged: (value){
                    //       print(_value.toString());
                    //       setState((){
                    //         _value = value;
                    //       });
                    //     },),
                    //     const Text("Remember me", style: TextStyle(fontSize: 16,color: Colors.green),)
                    //   ],
                    // ),
                    const SizedBox(
                      height: 9,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_value) {
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', _emailController.text);
                            prefs.setString(
                                "password", _passwordController.text);
                            prefs.setBool('check', _value);
                          } else {
                            prefs.remove("check");
                          }
                          navigateToHomeScreen();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
                          GestureDetector(
                            onTap: ()async {
                              // await _signIn();
                              // navigateToHomeScreen();

                              final account = await _signIn();
                              if (account != null) {
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              } else {
                                // Đăng nhập thất bại, xử lý lỗi tại đây
                              }

                              // Xử lý sự kiện khi người dùng nhấn vào Icon
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                            ),
                          ),

                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                                "assets/icons/google-icon.svg"),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset("assets/icons/twitter.svg"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:4.0),
                          child: GestureDetector(
                            onTap: () async {
                              final result = await Navigator.pushNamed(
                                  context, RegisterScreen.routeName);
                              User? user = result as User?;
                              _emailController.text = user!.name!;
                              _passwordController.text = user!.password!;
                            },

                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 14),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
