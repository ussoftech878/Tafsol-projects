import 'package:flutter/material.dart';
import 'package:wazefni_iraq/constants/assets.dart';

////PersonalInformationScreen  for Employer Signup
class PersonalInformationScreen extends StatelessWidget {
  static const routeName = 'PersonalInformationScreen';
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Image.asset(imageAssets.pf),
          Container(
            height: double.infinity,
            color: Colors.red,
            child: const Column(),
          )
        ],
      ),
    );
  }
}
