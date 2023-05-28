import 'package:flutter/material.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomLeft,
      // child: Image.asset("assets/images/dish_2.png"),
    );
  }
}
