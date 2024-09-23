import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: outLineBorder(),
        focusedBorder: outLineBorder(),
        hintText: 'Search',
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 24,
        ),
      ),
    );
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white));
  }
}
