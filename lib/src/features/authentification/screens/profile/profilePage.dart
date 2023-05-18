// ignore: file_names
import 'package:flutter/material.dart';

import '../../../../repository/authentification_repository/authentification_repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15.0),
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('chemin/vers/mon_image.png'),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Nom de l\'utilisateur',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                      title: const Text('Modifier le profil'),
                      onTap: () {
                        // Action pour modifier le profil
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      title: const Text('Publier une annonce'),
                      onTap: () {
                        // Action pour publier une annonce
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(
                        Icons.list,
                        color: Colors.green,
                      ),
                      title: const Text('Consulter mes annonces'),
                      onTap: () {
                        // Action pour consulter mes annonces
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.green,
                      ),
                      title: const Text('Déconnexion'),
                      onTap: () {
                        AuthenticationRepository.instance.logout();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
