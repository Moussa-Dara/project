// ignore: file_names
// ignore_for_file: library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

final CollectionReference<Map<String, dynamic>> _voitureCollection =
    FirebaseFirestore.instance.collection('voitures');

class PublicationAnnoncePage extends StatefulWidget {
  const PublicationAnnoncePage({super.key});

  @override
  _PublicationAnnoncePageState createState() => _PublicationAnnoncePageState();
}

TextEditingController _marqueController = TextEditingController();
TextEditingController _modeleController = TextEditingController();
TextEditingController _anneeController = TextEditingController();
TextEditingController _kilometrageController = TextEditingController();
TextEditingController _prixController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();


class _PublicationAnnoncePageState extends State<PublicationAnnoncePage> {


  void _pickImages() async {
  List<Asset>? resultList = [];

      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: 5, // Limit maximum of 5 images
          enableCamera: true, // Enable camera option
          materialOptions: const MaterialOptions(
            actionBarTitle: 'Select Images', // Action bar title
          ),
        );
      } catch (e) {
        print('Error selecting images: $e');
      }

      if (resultList != null && resultList.isNotEmpty) {
        List<String> imageUrls = [];

        for (Asset asset in resultList) {
          String imageUrl = await asset.getByteData().then((byteData) {
            // Assuming you upload the image and get the URL from the server
            // Replace this with your actual image upload logic
            return 'https://example.com/images/${asset.name}';
          });

          imageUrls.add(imageUrl);
        }

        setState(() {
          _selectedImages = imageUrls;
        });
      }
    }
  
  List<String> _selectedImages = [];



   String? _selectedStatut;
  final List<String> _statuts = ['En vente', 'En location', 'Les deux'];

  String? _selectedcarburants;
  final List<String> _carburants = ['Essence', 'Gazoil'];

  String? _selectedtransmission;
  final List<String> _transmission = ['Manuelle', 'Automatique'];

  

  final _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publication d\'annonce'),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              controller: _marqueController,
              decoration: const InputDecoration(
                labelText: 'Marque',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer une marque';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _modeleController,
              decoration: const InputDecoration(
                labelText: 'Modèle',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un modèle';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _anneeController,
              decoration: const InputDecoration(
                labelText: 'Année',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer une année';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _kilometrageController,
              decoration: const InputDecoration(
                labelText: 'Kilométrage',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un kilométrage';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
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
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
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
            TextFormField(
              controller: _prixController,
              decoration: const InputDecoration(
                labelText: 'Prix',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un prix';
                }
                return null;
              },
            ),

            ElevatedButton(
                onPressed: _pickImages,
                child: Text('Add Images'),
            ),
            const SizedBox(height: 16.0),
    
          if (_selectedImages.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Images:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                for (String imageUrl in _selectedImages)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(imageUrl),
                  ),
              ],
            ),



            const SizedBox(height: 8.0),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),*/
              ),
              keyboardType: TextInputType.multiline,
              minLines: 2,
              maxLines: 3,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer une description';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Create a map of the data to be saved
                      Map<String, dynamic> data = {
                        'marque': _marqueController.text,
                        'modele': _modeleController.text,
                        'annee': _anneeController.text,
                        'kilometrage': _kilometrageController.text,
                        'carburant': _selectedcarburants,
                        'transmission': _selectedtransmission,
                        'statut': _selectedStatut,
                        'prix': _prixController.text,
                        'description': _descriptionController.text,
                        'images': _selectedImages,
                      };

                      // Save the data to Firestore
                      try {
                        await _voitureCollection.add(data);
                        // Clear the form
                        _formKey.currentState!.reset();
                        // Clear the selected images
                        setState(() {
                          _selectedImages.clear();
                        });
                        // Show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Car saved successfully')),
                        );
                      } catch (e) {
                        print('Error saving car: $e');
                      }
                    }
        },
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
