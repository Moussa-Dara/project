import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/signup_form_widget.dart';
import '../../../../constants/sizes.dart';
import 'widgets/signup_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              'CarLoc',
              style: GoogleFonts.satisfy(textStyle: TextStyle(fontSize: 35), color: Colors.black) ,
            ),
            
          ),
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