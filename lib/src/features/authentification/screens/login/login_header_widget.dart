import 'package:flutter/material.dart';
import '../../../../constants/text.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tLoginTitle, style: Theme.of(context).textTheme.displayLarge),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}