// ignore: file_names
// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:dio/dio.dart';


class PublicationAnnoncePage extends StatefulWidget {
  const PublicationAnnoncePage({super.key});

  @override
  _PublicationAnnoncePageState createState() => _PublicationAnnoncePageState();
}



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
              onPressed: () {},
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
