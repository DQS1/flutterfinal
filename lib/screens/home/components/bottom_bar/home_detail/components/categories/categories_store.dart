import 'package:flutter/material.dart';
import 'package:flutterfinal/models/categories.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/categories/categories_service.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'categories_item.dart';

class CategoriesStore extends StatefulWidget {
  const CategoriesStore({Key? key}) : super(key: key);

  @override
  State<CategoriesStore> createState() => _CategoriesStoreState();
}

class _CategoriesStoreState extends State<CategoriesStore> {
  List<Categories> categories = []; // initialize to an empty list
  final CategoriesService categoriesService = CategoriesService();

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    categories = await categoriesService.categoriesStore(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                    child: Text(
                  "Danh sách khách sạn theo sao",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
                Text(
                  "See more",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories?.length,
                itemBuilder: (context, index) {
                  return CateItem(categories: categories![index]);
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}
class HotelListArguments {
  final Hotel hotel;
  HotelListArguments({required this.hotel});
}