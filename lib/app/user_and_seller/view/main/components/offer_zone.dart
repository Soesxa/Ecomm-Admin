import 'package:flutter/material.dart';

offerZone() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Offer Zone",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                  width: 250,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 5)
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          children: [
                            OfferCard(
                              imageUrl: '',
                              title: '',
                              originalPrice: 500,
                              discountedPrice: 300,
                              discountText: '',
                              buttonText: '',
                              onTap: () {},
                            ),
                            OfferCard(
                              imageUrl: '',
                              title: '',
                              originalPrice: 500,
                              discountedPrice: 300,
                              discountText: '',
                              buttonText: '',
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}

class OfferCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double originalPrice;
  final double discountedPrice;
  final String discountText;
  final String buttonText;
  final void Function() onTap;

  const OfferCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountText,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Adjust width as needed
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/headphone_13.png',
              fit: BoxFit.cover,
              height: 150, // Adjust height as needed
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                formattedPrice(originalPrice),
                style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey),
              ),
              const SizedBox(width: 5),
              Text(
                formattedPrice(discountedPrice),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            discountText,
            style: const TextStyle(fontSize: 14, color: Colors.green),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  String formattedPrice(double price) {
    // Format price as needed (e.g., currency symbol, decimal places)
    return "\$${price.toStringAsFixed(2)}";
  }
}
