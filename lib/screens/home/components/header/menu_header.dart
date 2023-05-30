import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
             Expanded(
                child: Text(
              "Thông tin tài khoản",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
