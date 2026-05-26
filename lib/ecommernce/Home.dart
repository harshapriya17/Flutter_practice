import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'HorizontalProducts.dart';
import 'VerticalProducts.dart';
import 'MixProducts.dart';
import 'ComboProducts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          products = data['products'];
        });
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
    }
  }

  Widget getSelectedView() {
    if (selectedIndex == 0) {
      return HorizontalProducts(products: products);
    } else if (selectedIndex == 1) {
      return VerticalProducts(products: products);
    } else if (selectedIndex == 2) {
      return MixProducts(products: products);
    } else {
      return ComboProducts(products: products);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Amazon",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      body: products.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : getSelectedView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel),
            label: "Horizontal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: "Vertical",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Mix",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Combo",
          ),
        ],
      ),
    );
  }
}
