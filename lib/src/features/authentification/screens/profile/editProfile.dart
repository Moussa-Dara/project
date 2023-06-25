import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentification/controllers/user_controller.dart';

// ignore: camel_case_types
class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

// ignore: camel_case_types
class _editProfileState extends State<editProfile> {
    //@override
  /*void initState() {
    super.initState();
    _nom =  Get.put(UserController());// Remplacez "userController.user.value.profile.nom" par votre récupération depuis la BD Firebase
  }*/
   /*@override
    void initState() {
    super.initState();
    _nomController = TextEditingController(
        text:
        Get.put(UserController() as String?));// Remplacez "userController.user.value.profile.nom" par votre récupération depuis la BD Firebase
  }
   @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }*/
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
        final UserController userController =
        Get.put(UserController()); /* Get.find<UserController>()*/
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text('Modifier Profil'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
           children: [
            TextFormField(
              controller: TextEditingController(text: userController.user.value.profile),
              decoration: const InputDecoration(
                labelText: 'Nom',
              ),
            ),
            TextFormField(
              //controller: TextEditingController(text: userController.user.value.),
              decoration: const InputDecoration(
                labelText: 'Numéro',
              ),
            ),
          ],
        )
       
      ),
    ));
    }
}