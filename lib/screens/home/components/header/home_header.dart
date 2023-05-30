import 'package:flutter/material.dart';
import 'package:flutterfinal/screens/cart/cart_screen.dart';
import 'package:flutterfinal/screens/search/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../language/appLocalizations.dart';
import '../../../../widgets/common_card.dart';
import '../../../../widgets/common_search_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).padding.top,
      child: CommonCard(
        radius: 36,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(38) ,border: Border.all(  color: Colors.blue)),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(38)),
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            child: CommonSearchBar(
              iconData: FontAwesomeIcons.search,
              enabled: false,
              text: "Where are you going",
            ),

          ),
        ),
      ),
    );
  }
}
