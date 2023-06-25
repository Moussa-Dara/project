import 'package:flutter/material.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final _formKey = GlobalKey<FormState>();

  String? selectedFuelType;
  List<String> fuelTypes = ['Essence', 'Diesel', 'Électrique']; // Liste prédéfinie de types de carburant
  

  String? selectedtransmission;
  List<String> transmission = ['Manuelle', 'Automatique'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              TextField(
              onChanged: (value) {
              },
              decoration: const InputDecoration(
                labelText: 'Marque',
              ),
            ),
            TextField(
              onChanged: (value) {
                
              },
              decoration: const InputDecoration(
                labelText: 'Modèle',
              ),
            ),
            DropdownButtonFormField<String>(
              
              onChanged: (value) {
                setState(() {
                  selectedFuelType = value!;
                });
              },
              items: fuelTypes.map((fuelType) {
                return DropdownMenuItem(
                  value: fuelType,
                  child: Text(fuelType),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Carburant',
              ),
            ),
            DropdownButtonFormField<String>(
              
              onChanged: (value) {
                setState(() {
                  selectedtransmission = value!;
                });
              },
              items: transmission.map((transmission) {
                return DropdownMenuItem(
                  value: transmission,
                  child: Text(transmission),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Type de transmission',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Validez le formulaire et passez les critères de recherche à la page principale
                
              },
              child: Text('Rechercher'),
            ),
          ],
        ),
      ),
    );
       

  }
}