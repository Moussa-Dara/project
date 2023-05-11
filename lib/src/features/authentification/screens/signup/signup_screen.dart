import 'package:flutter/material.dart';
import 'widgets/signup_form_widget.dart';
import '../../../../constants/sizes.dart';
import 'widgets/signup_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                SignUpHeaderWidget(),
                SignUpFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}