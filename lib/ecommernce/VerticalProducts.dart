import 'package:flutter/material.dart';
import 'ProductDetails.dart';

class VerticalProducts extends StatelessWidget {

  final List products;

  const VerticalProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

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
    );
  }
}
