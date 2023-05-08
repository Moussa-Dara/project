import 'package:flutter/material.dart';
import '../../../../constants/text.dart';
import '../../../../constants/sizes.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
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
                  onPressed: () {}, child: const Text(tForgetPassword, style: TextStyle(color: Colors.green)),),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tLogin.toUpperCase()),
              ),
            ),
            const SizedBox(height: 26),
            
            Column(
              children: [
                GestureDetector(
                  child: 
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Je n'ai pas de compte, m'inscrire",
                        style: 
                          TextStyle(
                            color: Colors.green,decoration: TextDecoration.underline,
                          ),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}