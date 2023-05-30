import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/models/rooms.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'booking_room_services.dart';
import 'package:provider/provider.dart';
import 'package:flutterfinal/providers/user_provider.dart';

class BookHotelForm extends StatefulWidget {
  final double pricePerNight;
  final String roomName;

  BookHotelForm({Key? key, required this.pricePerNight,required this.roomName}) : super(key: key);

  @override
  _BookHotelFormState createState() => _BookHotelFormState();
}

class _BookHotelFormState extends State<BookHotelForm> {
  int _quantity = 1;
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  double _totalPrice = 0;
  double _reduce=0;
  double _final=0;

  int _point = 1;


  final BookingRoomService bookingRoomService = BookingRoomService();

  void _calculateTotalPrice() {
    if (_checkInDate != null && _checkOutDate != null) {
      final userPoint = Provider.of<UserProvider>(context, listen: false).user.customerPoints;
      final difference = _checkOutDate!.difference(_checkInDate!);
      // if(userPoint! >30)
      //   {
          _totalPrice = difference.inDays * widget.pricePerNight * _quantity;
          _final =(( difference.inDays * widget.pricePerNight * _quantity)*0.95);
          _reduce=(( difference.inDays * widget.pricePerNight * _quantity)*0.05);
        // }
      // if(_totalPrice>0 && _totalPrice<1000000){
      //   _point=1;
      // }
      // print(_quantity);

      // if(_totalPrice>1000000 && _totalPrice<5000000)
      //   {
      //     _point=5;
      //   }
      // if( _totalPrice>5000000)
      //   {
      //     _point=10;
      //   }
    }
  }

  void _updateQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
      _calculateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = Provider.of<UserProvider>(context, listen: false).user.email;
    final name = Provider.of<UserProvider>(context, listen: false).user.name;
    final id = Provider.of<UserProvider>(context, listen: false).user.id;

    final customerPoint = Provider.of<UserProvider>(context, listen: false).user.customerPoints;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Book Hotel',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Check-in date'),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _checkInDate = selectedDate;
                    });
                  }
                  _calculateTotalPrice();
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _checkInDate == null
                            ? 'Select Check-in Date'
                            : DateFormat.yMMMd().format(_checkInDate!),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Check-out date'),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _checkOutDate = selectedDate;
                    });
                  }
                  _calculateTotalPrice();
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _checkOutDate == null
                            ? 'Select Check-out Date'
                            : DateFormat.yMMMd().format(_checkOutDate!),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Quantity'),
              SizedBox(height: 8.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      final newQuantity = (_quantity > 1) ? _quantity - 1 : 1;
                      _updateQuantity(newQuantity);
                    },
                    icon: Icon(Icons.remove),
                  ),
                  SizedBox(width: 16.0),
                  Text('$_quantity'),
                  SizedBox(width: 16.0),
                  IconButton(
                    onPressed: () {
                      final newQuantity = _quantity + 1;
                      _updateQuantity(newQuantity);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text('Total Price: ${_totalPrice}'),

              Text('Giảm : ${_reduce}'),
              Text('Tiền phải trả: ${_final}'),
              ElevatedButton(
                onPressed: () async {
                  // TODO: Handle booking logic
                  print(_totalPrice);
                  bookingRoomService.Booking(
                    context: context,
                    userId: id,
                    guestName: name ?? '',
                    guestEmail: email ?? '',
                    checkInDate: _checkInDate!.toString(),
                    checkOutDate: _checkOutDate!.toString(),
                    price: _final.toString(),
                    roomType: widget.roomName,
                    status: "pending",
                    quantity: _quantity ?? 1,
                    point:_point ,
                  );

                  // Navigator.pop(context);
                },
                child: Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelDetailsScreen extends StatelessWidget {
  final double pricePerNight;
  final String roomName;

  HotelDetailsScreen({Key? key, required this.pricePerNight,required this.roomName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Details'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BookHotelForm(pricePerNight: pricePerNight,roomName: roomName ?? 'Phòng 2 người',);
              },
            );
          },
          child: Text('Book Hotel'),
        ),
      ),
    );
  }
}