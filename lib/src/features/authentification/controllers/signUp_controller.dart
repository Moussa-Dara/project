import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentification_repository/authentification_repository.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  /// This func will be used to register user with [EMAIL] & [Password]


  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication
  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentification(phoneNo);
  }
}