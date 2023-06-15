import 'package:flutter/material.dart';

class Announcement {
  final List<String> imageUrls;
  final String price;
  final String status;
  final String marque;
  final String model;

  Announcement({
    required this.imageUrls,
    required this.price,
    required this.status,
    required this.marque,
    required this.model,
  });
}

class AnnouncementDetailsPage extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementDetailsPage({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcement Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: announcement.imageUrls.length,
              itemBuilder: (context, index) {
                final imageUrl = announcement.imageUrls[index];
                return Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: \$${announcement.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform action based on the announcement's status
                    if (announcement.status == 'En vente') {
                      // Perform action for sale
                      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SalePage()));
                    } else if (announcement.status == 'En location') {
                      // Perform action for rental
                      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => RentalPage()));
                    }
                  },
                  child: Text(
                    announcement.status == 'En vente' ? 'Purchase' : 'Loan',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
