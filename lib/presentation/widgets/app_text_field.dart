import 'package:flutter/material.dart';

enum TextFieldType { normal, password }

/// A customizable text input field widget that can be used to display normal
/// or password fields.
class AppTextField extends StatefulWidget {
  /// The type of text field to display, either normal or password.
  final TextFieldType type;

  /// The hint text to display in the text field.
  final String hintText;

  /// The error text to display if the user input is invalid.
  final String? errorText;

  /// The text controller for the text field.
  final TextEditingController? controller;

  /// Creates a new [AppTextField] instance.
  const AppTextField({
    Key? key,
    required this.type,
    required this.hintText,
    this.controller,
    this.errorText,
  }) : super(key: key);

  /// A factory constructor for creating password text fields.
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

  /// A factory constructor for creating normal text fields.
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
        errorText: widget.errorText,
      ),
      controller: widget.controller,
    );
  }

  /// Builds a suffix icon for password text fields that toggles the text
  /// visibility.
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
