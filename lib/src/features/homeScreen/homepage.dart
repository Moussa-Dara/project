// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../authentification/screens/annonces/add_announcement.dart';
import '../authentification/screens/annonces/announcement_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('voitures').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return Text('No data available');
          }

          final announcements = documents.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final imageUrls = List<String>.from(data['imageUrls'] ?? []);
            final price = data['price'] ?? '';
            final status = data['status'] ?? '';
            final marque = data['marque'] ?? '';
            final model = data['model'] ?? '';
            final carburant = data['carburant'] ?? '';
            final transmission = data['transmission'] ?? '';
            final description = data['description'] ?? '';
            final contact = data['contact'] ?? '';

            return Announcement(
                imageUrls: imageUrls,
                price: price,
                status: status,
                marque: marque,
                carburant: carburant,
                transmission: transmission,
                description: description,
                contact: contact,
                model: model);
          }).toList();

          return ListView.builder(
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              final announcement = announcements[index];
              return AnnounceSection(announcement: announcement);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the form page to add a new announcement
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAnnouncementPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AnnounceSection extends StatelessWidget {
  final Announcement announcement;

  const AnnounceSection({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String firstImageUrl =
        announcement.imageUrls.isNotEmpty ? announcement.imageUrls[0] : '';
    final List<String> otherImageUrls = announcement.imageUrls.length > 1
        ? announcement.imageUrls.sublist(1)
        : [];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AnnouncementDetailsPage(announcement: announcement),
                ),
              );
            },
            child: Image.network(
              firstImageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          /*  if (otherImageUrls.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final imageUrl in otherImageUrls)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),*/
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${announcement.marque} ${announcement.model}\n Prix: ${announcement.price} MRU',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
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
                    },
                      /*if (announcement.status == 'En vente') {
                      // Perform action for sale
                      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SalePage()));
                    } else if (announcement.status == 'En location') {
                      // Perform action for rental
                      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => RentalPage()));
                    }*/
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
