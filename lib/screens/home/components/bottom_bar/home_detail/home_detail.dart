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
import '../../../../search/search_screen.dart';
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
        children: [_slider(), CategoriesStore(), ProductPopular()],
      ),
    );
  }

  Widget _slider() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 350,
        child: HomeExploreSliderView(
          click: () {},
        ),
      ),
      //serachUI(),
      //_viewHotelsButton(),
    );
  }

  _viewHotelsButton() {
    return Positioned(
      bottom: 32,
      left: 24,
      right: 24,
      child: CommonButton(
        onTap: () {},
        buttonTextWidget: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
          child: Text(
            "View Hotel",
            style: TextStyles(context)
                .getRegularStyle()
                .copyWith(color: AppTheme.whiteColor),
          ),
        ),
      ),
    );
  }

  Widget serachUI() {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: CommonCard(
          radius: 36,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(38)),
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            child: CommonSearchBar(
              iconData: FontAwesomeIcons.search,
              enabled: false,
              text: "where are you going",
            ),
          ),
        ),
      ),
    );
  }
}
