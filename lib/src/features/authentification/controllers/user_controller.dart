import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class User {
  bool isConnected;
  String profile;

  User({required this.isConnected, required this.profile});
}

class UserController extends GetxController {
  
  static UserController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  Rx<User> user = User(isConnected: false, profile: '').obs;
bool get isConnected => user.value.isConnected;

  Future<void> login(String phoneNo, String password) async {
    final userRef = FirebaseFirestore.instance.collection('Users');
    final querySnapshot =
        await userRef.where('Phone', isEqualTo: phoneNo).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      if (userData['Password'] == password) {
    user.value = User(isConnected: true, profile: userData['FullName']);
       // Get.to(() => const ProfilePage());
      } else {
        Get.snackbar("Error", "Something went erong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        print("Error".toString());
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    user.value = User(isConnected: false, profile: '');
    Get.back();
  }
}