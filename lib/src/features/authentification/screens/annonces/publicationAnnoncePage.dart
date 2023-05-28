// ignore: file_names
import 'package:flutter/material.dart';

class PublicationAnnoncePage extends StatefulWidget {
  const PublicationAnnoncePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PublicationAnnoncePageState createState() => _PublicationAnnoncePageState();
}

class _PublicationAnnoncePageState extends State<PublicationAnnoncePage> {

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
