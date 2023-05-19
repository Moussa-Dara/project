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
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Marque',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Marque';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Modèle',
                    border: OutlineInputBorder(
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an modele';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Année',
                    border: OutlineInputBorder(
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an Année';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Kilométrage',
                    border: OutlineInputBorder(
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an Kilométrage';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: DropdownButtonFormField<String>(
                  
                  value: _selectedcarburants,
                  items: _carburants.map((String carburants) {
                    return DropdownMenuItem<String>(
                      value: carburants,
                      child: Text(carburants)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedcarburants = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Type de carburant',
                    border: OutlineInputBorder(
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: DropdownButtonFormField<String>(
                  
                  value: _selectedtransmission,
                  items: _transmission.map((String transmission) {
                    return DropdownMenuItem<String>(
                      value: transmission,
                      child: Text(transmission)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedtransmission = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Type de transmission',
                    border: OutlineInputBorder(
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: DropdownButtonFormField<String>(
                  
                  value: _selectedStatut,
                  items: _statuts.map((String statut) {
                    return DropdownMenuItem<String>(
                      value: statut,
                      child: Text(statut)
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
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Prix',
                    border: OutlineInputBorder(
                      borderRadius:
                        BorderRadius.all(Radius.circular(20.0)
                      )
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an Prix';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          )),
    );
  }
}
