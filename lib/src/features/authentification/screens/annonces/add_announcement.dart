import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

String? _selectedStatut;
final List<String> _statuts = ['En vente', 'En location', 'Les deux'];

String? _selectedcarburants;
final List<String> _carburants = ['Essence', 'Gazoil'];

String? _selectedtransmission;
final List<String> _transmission = ['Manuelle', 'Automatique'];

class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({super.key});

  @override
  _AddAnnouncementPageState createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  List<String> imageUrls = [];
  String price = '';
  String status = '';
  String marque = '';
  String model = '';
  String annee = '';
  String kilometrage = '';
  String description = '';
  String carburant = '';
  String transmission = '';


  final picker = ImagePicker();

  void _pickImage() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose Image Source'),
        content: const Text('Do you want to use the camera or gallery?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              _captureImageFromCamera();
            },
            child: const Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              _pickImageFromGallery();
            },
            child: const Text('Gallery'),
          ),
        ],
      );
    },
  );
}

Future<void> _captureImageFromCamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // Upload the image to Firebase Storage
      final imageUrl = await uploadImageToFirebaseStorage(pickedImage.path);

      setState(() {
        imageUrls.add(imageUrl);
      });
    }
}

Future<void> _pickImageFromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Upload the image to Firebase Storage
      final imageUrl = await uploadImageToFirebaseStorage(pickedImage.path);

      setState(() {
        imageUrls.add(imageUrl);
      });
    }
}


  Future<String> uploadImageToFirebaseStorage(String imagePath) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final reference =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);

    final uploadTask = reference.putFile(File(imagePath));

    final snapshot = await uploadTask;

    if (snapshot.state == firebase_storage.TaskState.success) {
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } else {
      throw Exception('Failed to upload image');
    }
  }

  Future<void> _saveAnnouncement() async {
    if (price.isNotEmpty &&
        imageUrls.isNotEmpty &&
        marque.isNotEmpty &&
        model.isNotEmpty) {
      // Save the announcement data to Firestore
      await FirebaseFirestore.instance.collection('voitures').add({
        'imageUrls': imageUrls,
        'price': price,
        'status': _selectedStatut,
        'marque': marque,
        'model': model,
        'kilometrage': kilometrage,
        'description': description,
        'transmission': _selectedtransmission,
        'carburant' : _selectedcarburants
      });

      // Navigate back to the homepage
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Incomplete Form'),
          content: const Text(
              'Please fill in all the required fields and add at least one image.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Announcement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  marque = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Marque',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  model = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Model',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  kilometrage = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Kilometrage',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  price = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Prix',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedcarburants,
              items: _carburants.map((String carburant) {
                return DropdownMenuItem<String>(
                  value: carburant,
                  child: Text(carburant),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedcarburants = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Type de carburant',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _selectedtransmission,
              items: _transmission.map((String transmission) {
                return DropdownMenuItem<String>(
                  value: transmission,
                  child: Text(transmission),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedtransmission = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Type de transmission',
              ),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _selectedStatut,
              items: _statuts.map((String statut) {
                return DropdownMenuItem<String>(
                  value: statut,
                  child: Text(statut),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatut = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Statut de la voiture',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Add Images'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // Set the button's background color to gray
                onPrimary: Colors.white, // Set the button's text color to white
              ),
            ),

            const SizedBox(height: 16.0),
            if (imageUrls.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Images:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(imageUrls.toString()),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: _saveAnnouncement,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
