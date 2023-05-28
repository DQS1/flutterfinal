import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/screens/home/components/bottom_bar/home_detail/components/product_popular/services/product_service.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Hotel> allProducts = [];
  List<Hotel> searchResults = [];
  final HoetlService productService = HoetlService();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    allProducts = await productService.hotelPopular(context: context);
    setState(() {});
  }

  final TextEditingController _searchController = TextEditingController();

  void searchProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    final List<Hotel> matches = allProducts.where((product) {
      final name = product.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return name.contains(queryLower);
    }).toList();

    setState(() {
      searchResults = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                _searchController.clear();
                searchProducts('');
              },
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          onChanged: searchProducts,
        ),
      ),
      body: searchResults.isNotEmpty
          ? ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final product = searchResults[index];
                return ListTile(
                  leading: Image.network(
                    product.image_url ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.description ?? ''),
                  trailing: Text(product.price_range!),
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: ProductDetailsArguments(hotel: product));
                  },
                );
              },
            )
          : const Center(
              child: Text('Search results will be displayed here'),
            ),
    );
  }
}
