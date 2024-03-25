import 'package:flutter/material.dart';

class EcoButton extends StatelessWidget {
  const EcoButton({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 32),
        ),
        backgroundColor: MaterialStateProperty.all(const Color(0XFF173309)),
      ),
      child: Text(text),
    );
  }
}
