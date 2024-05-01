import 'package:flutter/material.dart';
import 'package:mobile/resources/theme.dart';

class EcoTextField extends StatefulWidget {
  const EcoTextField({
    super.key,
    this.controller,
    this.password = false,
    required this.hintText,
    this.errorText,
  });

  final TextEditingController? controller;
  final bool password;
  final String hintText;
  final String? errorText;

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}

class _EcoTextFieldState extends State<EcoTextField> {
  late bool hidePassword;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.password;
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (!widget.password) {
      return null;
    }

    return IconButton(
      icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        setState(() {
          hidePassword = !hidePassword;
        });
      },
    );
  }

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
      controller: widget.controller,
      cursorColor: MediaQuery.of(context).platformBrightness == Brightness.light
          ? Colors.black
          : Colors.white,
      obscureText: hidePassword,
      enableSuggestions: !widget.password,
      autocorrect: !widget.password,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        fillColor: context.colorScheme.background,
        error: widget.errorText != null ? Text(widget.errorText!) : null,
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        suffixIcon: _buildSuffixIcon(context),
      ),
    );
  }
}
