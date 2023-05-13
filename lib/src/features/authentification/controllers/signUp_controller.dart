import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentification/models/user_model.dart';
import 'package:project/src/repository/user_repository/user_repository.dart';

import '../../../repository/authentification_repository/authentification_repository.dart';
import '../forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  /// This func will be used to register user with [EMAIL] & [Password]

  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentification(phoneNo);
  }
}
