import 'package:flutter/material.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text("S'INSCRIRE",
              style: TextStyle(fontSize: 30, color: Colors.green)),
        )
      ],
    );
  }
}
