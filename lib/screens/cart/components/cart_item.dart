import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';

import '../../../utils/helper.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/themes.dart';
import '../../../widgets/common_card.dart';
import 'package:intl/intl.dart';

class CartItem extends StatefulWidget {
  final Hotel hotel;

  const CartItem({Key? key, required this.hotel}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    String formattedNumber = NumberFormat('#,##0', 'vi_VN')
        .format(double.parse('${widget.hotel.price_range}'));
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: CommonCard(
          color: AppTheme.backgroundColor,
          child: ClipRect(
            //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
            child: AspectRatio(
              aspectRatio: 2.7,
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            widget.hotel.image_url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width >= 360
                                  ? 12
                                  : 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${widget.hotel.name}',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyles(context)
                                    .getBoldStyle()
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Khách sạn ${widget.hotel.star}',
                                style: TextStyles(context)
                                    .getDescriptionStyle()
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                FontAwesomeIcons.mapMarkerAlt,
                                                size: 12,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              Text(
                                                " 2",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyles(context)
                                                    .getDescriptionStyle()
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "km to city",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyles(context)
                                                      .getDescriptionStyle()
                                                      .copyWith(
                                                        fontSize: 14,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Helper.ratingStar(),
                                        ],
                                      ),
                                    ),
                                    FittedBox(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              // '\$190',
                                              '${formattedNumber}',
                                              textAlign: TextAlign.left,
                                              style: TextStyles(context)
                                                  .getBoldStyle()
                                                  .copyWith(fontSize: 15),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Text(
                                                "/per_night",
                                                style: TextStyles(context)
                                                    .getDescriptionStyle()
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ),
                                          ],
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
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      onTap: () {
                        Navigator.pushNamed(
                            context, ProductDetailScreen.routeName,
                            arguments:
                                ProductDetailsArguments(hotel: widget.hotel));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
