import 'package:flutter/material.dart';

enum TextFieldType { normal, password }

class AppTextField extends StatefulWidget {
  final TextFieldType type;
  final String hintText;
  final String? errorText;
  final TextEditingController? controller;

  const AppTextField({
    Key? key,
    required this.type,
    required this.hintText,
    this.controller,
    this.errorText,
  }) : super(key: key);

  factory AppTextField.password({
    required String hintText,
    TextEditingController? controller,
    String? errorText,
  }) {
    return AppTextField(
      type: TextFieldType.password,
      hintText: hintText,
      controller: controller,
      errorText: errorText,
    );
  }

  factory AppTextField.normal({
    required String hintText,
    TextEditingController? controller,
    String? errorText,
  }) {
    return AppTextField(
      type: TextFieldType.normal,
      hintText: hintText,
      controller: controller,
      errorText: errorText,
    );
  }

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.type == TextFieldType.password && _isObscureText,
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.hintText,
          suffixIcon: _buildSuffixIcon(),
          errorText: widget.errorText),
      // controller: controller,
    );
  }

  Widget? _buildSuffixIcon() {
    return widget.type == TextFieldType.password
        ? GestureDetector(
            onTap: () {
              setState(() {
                _isObscureText = !_isObscureText;
              });
            },
            child: _isObscureText
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          )
        : null;
  }
}
