import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:image_picker/image_picker.dart';


class PublicationAnnoncePage extends StatefulWidget {
  const PublicationAnnoncePage({Key? key}) : super(key: key);

  @override
  _PublicationAnnoncePageState createState() => _PublicationAnnoncePageState();
}

class _PublicationAnnoncePageState extends State<PublicationAnnoncePage> {
  String? _selectedStatut;
  final List<String> _statuts = ['En vente', 'En location', 'Les deux'];

  String? _selectedCarburant;
  final List<String> _carburants = ['Essence', 'Gazoil'];

  String? _selectedTransmission;
  final List<String> _transmissions = ['Manuelle', 'Automatique'];


  List<Asset> _selectedImages = <Asset>[];

  void _pickImages() async {
    List<Asset> resultList = <Asset>[];
    String? error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5, // Limite maximale de 5 images
        enableCamera: true, // Activer l'option d'appareil photo
        materialOptions: MaterialOptions(
          actionBarTitle: 'Sélectionnez des images', // Titre de l'action bar
        ),
      );
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    if (error == null && resultList.isNotEmpty) {
      setState(() {
        _selectedImages = resultList;
      });
    } else if (error != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erreur lors de la sélection des images'),
            content: Text(error!),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
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
              value: _selectedCarburant,
              items: _carburants.map((String carburant) {
                return DropdownMenuItem<String>(
                  value: carburant,
                  child: Text(carburant),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCarburant = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Type de carburant',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _selectedTransmission,
              items: _transmissions.map((String transmission) {
                return DropdownMenuItem<String>(
                  value: transmission,
                  child: Text(transmission),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTransmission = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Type de transmission',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Prix',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un prix';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer une description';
                }
                return null;
              },
            ),

              const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Importer des images'),
              
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
