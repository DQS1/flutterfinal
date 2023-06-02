import 'package:flutter/material.dart';
import 'package:flutterfinal/models/bookingmodel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetail extends StatefulWidget {
  final BookingModel book;
  const OrderDetail({Key? key, required this.book}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    String formattedNumber = NumberFormat('#,##0', 'vi_VN')
        .format(double.parse('${widget.book.price}'));


    DateTime dateTime = DateTime.parse(widget.book.checkInDate);
    String formattedDateCheckIn = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    DateTime dateTime2 = DateTime.parse(widget.book.checkOutDate);
    String formattedDateCheckOut = "${dateTime2.day}/${dateTime2.month}/${dateTime2.year}";


    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 350,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(10.76971413383295, 106.66640733453406),
                zoom: 16.0,
                maxZoom: 18.0,
                minZoom: 3.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(10.76971413383295, 106.66640733453406),
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          size: 50,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 300),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    ' ${widget.book.roomType}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Thông tin người dùng',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.mail_outline,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Email: ${widget.book.guestEmail}',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Tên: ${widget.book.guestName}',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Thông tin phòng",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Khách sạn: ${widget.book?.hotelName}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Status: ${widget.book.status}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Số lượng phòng: ${widget.book.quantity}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Ngày CheckIn: ${formattedDateCheckIn} ",
                              textAlign: TextAlign.justify,
                              softWrap: false,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Ngày CheckOut: ${formattedDateCheckOut} ",
                              textAlign: TextAlign.justify,
                              softWrap: false,
                              style: GoogleFonts.notoSansJavanese(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Loại phòng: ${widget.book.roomType}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSansJavanese(fontSize:18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Giá tiền phòng:   ${formattedNumber} VND",
                              style: GoogleFonts.notoSansJavanese(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ],
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
                "Detail",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
