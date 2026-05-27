import 'dart:async';
import 'package:flutter/material.dart';
import 'Card.dart';

class HomePage extends StatefulWidget {
  final List products;
  final List cartItems;

  const HomePage({
    super.key,
    required this.products,
    required this.cartItems,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final PageController pageController = PageController(viewportFraction: 0.92);
  int currentPage = 0;
  List filteredProducts = [];

  final List<String> categories = [
    "women's clothing",
    "bags",
    "beauty",
    "heels",
    "jewelry",
  ];

  final List<String> adImages = [
    "https://images.unsplash.com/photo-1529139574466-a303027c1d8b",
    "https://images.unsplash.com/photo-1483985988355-763728e1935b",
    "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
  ];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
    autoScrollAds();
  }

  void searchCategory(String value) {
    setState(() {
      filteredProducts = widget.products.where((product) {
        return product['category']
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
    });
  }

  void autoScrollAds() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) return;
      if (currentPage < adImages.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Girlee"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: searchCategory,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Color(0xFF1A237E)),
                    hintText: "Search Categories...",
                  ),
                ),
              ),
            ),

            // ADS
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: pageController,
                itemCount: adImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(adImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // CATEGORIES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => searchCategory(categories[index]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF1A237E).withOpacity(0.3)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        categories[index].toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // GRID TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Trending Fashion",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
              ),
            ),
            const SizedBox(height: 15),

            // GRID VIEW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length >= 4 ? 4 : filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product,
                    cartItems: widget.cartItems,
                    onAdded: () => setState(() {}),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // MORE PRODUCTS LIST VIEW
            if (filteredProducts.length > 4) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "More to Explore",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length - 4,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index + 4];
                  return Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(product['image'], width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      title: Text(product['title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: Stack(
                        children: [
                          Text(
                            "\$${product['price']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1.5
                                ..color = Colors.orange,
                            ),
                          ),
                          Text(
                            "\$${product['price']}",
                            style: const TextStyle(
                              color: Color(0xFF1A237E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart_outlined, color: Color(0xFF1A237E)),
                        onPressed: () {
                          widget.cartItems.add(product);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart")));
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
