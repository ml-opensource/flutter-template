import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    required this.isLoading,
    required this.disabled,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? borderColor;
  final bool isLoading;
  final bool disabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: context.colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: borderColor ?? context.colors.text),
        minimumSize: const Size(double.infinity, 52.0),
      ),
      child: !isLoading ? child : const CircularProgressIndicator(),
    );
  }
}
