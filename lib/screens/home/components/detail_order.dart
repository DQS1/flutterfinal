import 'package:flutter/material.dart';
import 'package:flutterfinal/models/bookingmodel.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/screens/product_detail/components/add_favorite.dart';
import 'package:flutterfinal/screens/booking/Body.dart';
class BodyOrder extends StatelessWidget {
  final BookingModel hotel;
  const BodyOrder({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10),
              foregroundDecoration: const BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image(
                image: NetworkImage(hotel.price),
              )),

          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(' ${hotel.status}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        "8.4/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    const Spacer(),
                    // AddProductToFavorite(hotel: hotel,)

                    //    IconButton(
                    //
                    //     color: Colors.white,
                    //     icon: const Icon(Icons.heart_broken),
                    //     onPressed: () {
                    //       print(hotel.name);
                    //       AddProductToFavorite(hotel: hotel,);
                    //     },
                    //
                    // )

                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.purple,
                                    ),
                                  ],
                                ),
                                const Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                          Icons.location_on,
                                          size: 16.0,
                                          color: Colors.grey,
                                        )),
                                    TextSpan(text: "8 km to centrum")
                                  ]),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children:  <Widget>[
                              Text(
                                "check in \$ ${hotel.checkInDate}  /n check out ${hotel.checkOutDate}",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "/per night",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: const Text(
                            "Book Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, BookScreen.routeName,
                            //     arguments:
                            //     RoomsDetailsArguments(hotel: hotel));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Body1(hotel:hotel),
                            //   ),
                            // );
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(builder: (context) => BookScreen()), (r) => false);
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "${hotel.checkOutDate}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),

                    ],

                  ),

                ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
