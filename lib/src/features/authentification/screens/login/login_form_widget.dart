import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentification/controllers/user_controller.dart';
import 'package:project/src/repository/authentification_repository/authentification_repository.dart';
import '../../../../constants/text.dart';
import '../../../../constants/sizes.dart';
import '../signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final UserController userController = Get.find<UserController>();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(tForgetPassword,
                    style: TextStyle(color: Colors.green)),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  String phoneNo = phoneController.text;
                  String password = passwordController.text;
                   UserController.instance.login(phoneNo, password);
                
                },
                child: Text(tLogin.toUpperCase()),
              ),
            ),
            const SizedBox(height: 26),
            Column(
              children: [
                GestureDetector(
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Je n'ai pas de compte, m'inscrire",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
