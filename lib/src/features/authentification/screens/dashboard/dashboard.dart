import 'package:flutter/material.dart';
import 'package:project/src/repository/authentification_repository/authentification_repository.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("LOG OUT"),
          onPressed: () {
            AuthenticationRepository.instance.logout();
          },
        ),
      ),
    );
  }
}
