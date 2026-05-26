import 'package:flutter/material.dart';
import 'ProductDetails.dart';

class HorizontalProducts extends StatelessWidget {

  final List products;

  const HorizontalProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(12),

      child: GridView.builder(

        scrollDirection: Axis.vertical,

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
    );
  }
}
