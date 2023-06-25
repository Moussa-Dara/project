import 'package:flutter/material.dart';

class Announcement {
  final List<String> imageUrls;
  final String price;
  final String status;
  final String marque;
  final String model;
  final String carburant;
  final String transmission;
  final String description;
  final String contact;

  Announcement({
    required this.imageUrls,
    required this.price,
    required this.status,
    required this.marque,
    required this.model,
    required this.carburant,
    required this.transmission,
    required this.description,
    required this.contact,
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
                  '${announcement.marque} ${announcement.model}\n Carburant: ${announcement.carburant}\n Transmission: ${announcement.transmission}\n Description: ${announcement.description}\n Prix: ${announcement.price} MRU ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Contact Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Contact: ${announcement.contact}'),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.phone),
                                    onPressed: () {
                                      // Handle phone icon press
                                      // ...
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset('assets/whatsapp.png'),
                                    onPressed: () {
                                      // Handle WhatsApp icon press
                                      // ...
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );

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
                    announcement.status == 'En vente' ? 'Acheter' : 'Louer',
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
