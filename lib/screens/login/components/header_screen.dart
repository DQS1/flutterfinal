import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.bottomRight,
      // child: Image.asset("assets/images/dish.png"),
    );
  }
}
