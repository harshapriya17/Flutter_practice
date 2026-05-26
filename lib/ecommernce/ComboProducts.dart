import 'package:flutter/material.dart';
import 'ProductDetails.dart';

class ComboProducts extends StatelessWidget {

  final List products;

  const ComboProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.horizontal,

        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,

          crossAxisSpacing: 15,
          mainAxisSpacing: 15,

          childAspectRatio: 0.72,
        ),

        itemBuilder: (context, index) {

          final product = products[index];

          return GestureDetector(

            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) => ProductDetails(
                    product: product,
                  ),
                ),
              );
            },

            child: Container(

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                  ),
                ],
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Expanded(

                    child: ClipRRect(

                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),

                      child: Image.network(
                        product['thumbnail'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(

                    padding: const EdgeInsets.all(10),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          product['title'],

                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "\$${product['price']}",

                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,

          itemBuilder: (context, index) {

            final product = products[index];

            return GestureDetector(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) => ProductDetails(
                      product: product,
                    ),
                  ),
                );
              },

              child: Container(

                margin: const EdgeInsets.all(12),

                decoration: BoxDecoration(
        
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    ClipRRect(

                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),

                      child: Image.network(
                        product['thumbnail'],
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Expanded(

                      child: Padding(

                        padding: const EdgeInsets.all(15),

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(
                              product['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              product['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "\$${product['price']}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            },
          ),
        ),
      ],
    );
  }
}
