import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/HomeScreen/homepage.dart';
import 'package:project/src/features/HomeScreen/Search_Page.dart';
import 'package:project/src/features/authentification/screens/profile/profilePage.dart';
import 'package:project/src/repository/authentification_repository/authentification_repository.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
          .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //sauvegarder le nmr actu de la page

  int _currentIndex = 0;

  //mettre a jour le nmr de page
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          // ignore: prefer_const_constructors
          title: Text(
            'CarLoc',
            style: GoogleFonts.satisfy(
                textStyle: const TextStyle(fontSize: 35), color: Colors.black),
          ),
        ),
        //Naviguer entre les pages
        body: const [HomePage(), Search_Page(), ProfilePage()][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            mouseCursor: SystemMouseCursors.grab,
            backgroundColor: Colors.blue,
            iconSize: 25,
            elevation: 10,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Chercher'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ]),
      ),
    );
  }
}
