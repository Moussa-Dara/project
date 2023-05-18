import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentification/screens/profile/profilePage.dart';

import '../../features/authentification/screens/dashboard/dashboard.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {}

  Future<void> phoneAuthentification(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('error', 'the provided phone numberis not valid.');
          } else {
            Get.snackbar('error', 'something went wrong. Try again.');
          }
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> signInWithPhoneNumber(String phoneNo, String password) async {
    final userRef = FirebaseFirestore.instance.collection('Users');
    final querySnapshot =
       await userRef.where('Phone', isEqualTo: phoneNo).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      if (userData['Password'] == password) {
        Get.to(() => ProfilePage());
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
    Get.back();
  }
}
