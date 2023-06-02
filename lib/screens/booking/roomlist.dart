import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/models/rooms.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';
import '../../language/appLocalizations.dart';
import '../../utils/helper.dart';
import '../../utils/text_styles.dart';
import '../../widgets/common_button.dart';
import 'showmodal_booking.dart';
import 'package:intl/intl.dart';


class RoomItem2 extends StatelessWidget {
  final Map<String, dynamic> room;
  final String hotelName;

  RoomItem2({Key? key, required this.room,required this.hotelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomObject = Room(
        id: room['_id'] ?? "1",
        roomName: room['roomName'] ?? '',
        price: room['price'] ?? 0.0,
        quantity: room['quantity'] ?? 1,
        imageRoom: room['imageRoom']);
    String formattedNumber = NumberFormat('#,##0', 'vi_VN')
        .format(double.parse('${roomObject.price}'));
    return Padding(
      padding: const EdgeInsets.only(),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: PageView(
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Ink.image(
                          image: NetworkImage(roomObject.imageRoom),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Add a button widget here
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${roomObject.roomName}',
                          style: TextStyles(context)
                              .getBoldStyle()
                              .copyWith(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: SizedBox()),
                        SizedBox(
                          height: 42,
                          child: CommonButton(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return BookHotelForm(pricePerNight: roomObject.price!.toDouble(),roomName: roomObject.roomName,hotelName: hotelName,);
                                },
                              );
                            },
                            buttonTextWidget: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 4, bottom: 4),
                              child: Text(
                                "Book now",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${formattedNumber}',
                          textAlign: TextAlign.left,
                          style: TextStyles(context)
                              .getBoldStyle()
                              .copyWith(fontSize: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Text(
                              "/per night",
                            style: TextStyles(context)
                                .getRegularStyle()
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Số lượng phòng còn lại ${roomObject.quantity}',
                          // "${widget.roomData.dateTxt}",
                          textAlign: TextAlign.left,
                          style: TextStyles(context).getDescriptionStyle(),
                        ),
                        InkWell(
                          borderRadius:
                          BorderRadius.all(Radius.circular(4.0)),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                            'more details',
                                  style: TextStyles(context).getBoldStyle(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    // color: Theme.of(context).backgroundColor,
                                    size: 24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Add a Positioned widget to position the button at the top right corner of the widget
        ],
      ),
    );
  }
}
