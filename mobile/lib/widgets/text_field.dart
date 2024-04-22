import 'package:flutter/material.dart';
import 'package:mobile/resources/theme.dart';

class EcoTextField extends StatelessWidget {
  const EcoTextField({
    super.key,
    this.controller,
    this.password = false,
    required this.hintText,
  });

  final String hintText;
  final TextEditingController? controller;
  final bool password;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0XFF173309),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
      gapPadding: 0,
    );

    return TextField(
      controller: controller,
      cursorColor: MediaQuery.of(context).platformBrightness == Brightness.light
          ? Colors.black
          : Colors.white,
      obscureText: password,
      enableSuggestions: !password,
      autocorrect: !password,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        fillColor: context.colorScheme.background,
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }
}
