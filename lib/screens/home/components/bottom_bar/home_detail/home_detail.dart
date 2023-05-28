import 'package:flutter/material.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/categories/categories_store.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/product_popular/product_popular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../language/appLocalizations.dart';
import '../../../../../providers/theme_provider.dart';
import '../../../../../utils/enum.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../../utils/themes.dart';
import '../../../../../widgets/common_button.dart';
import '../../../../../widgets/common_card.dart';
import '../../../../../widgets/common_search_bar.dart';
import 'components/home_explore_slider_view.dart';
import 'package:provider/provider.dart';

late final AnimationController animationController;

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _slider(),
          CategoriesStore(),
          ProductPopular()
        ],
      ),
    );
  }

  Widget _slider() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 320,
        child: HomeExploreSliderView(
          click: () {},
        ),
      ),
    );
  }

  _viewHotelsButton() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 32,
              left: 24,
              right: 24,
              child: CommonButton(
                onTap: () {},
                buttonTextWidget: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 8, bottom: 8),
                  child: Text("View Hotel",
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(color: AppTheme.whiteColor),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }


  Widget serachUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: CommonCard(
        radius: 36,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(38)),
          onTap: () {},
          child: CommonSearchBar(
            iconData: FontAwesomeIcons.search,
            enabled: false,
            text: "where are you going",
          ),
        ),
      ),
    );
  }
}
