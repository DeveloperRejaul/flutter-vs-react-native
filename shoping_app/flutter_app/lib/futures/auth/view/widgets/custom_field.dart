import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String hint;
  final bool passwordSuffixIcon;
  final TextEditingController? controller;

  const CustomField({
    super.key,
    required this.hint,
    this.passwordSuffixIcon = false,
    this.controller,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        suffixIcon: widget.passwordSuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
      obscureText: widget.passwordSuffixIcon ? !isPasswordVisible : false,
      obscuringCharacter: "*",
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Input is required";
        }
        return null;
      },
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
