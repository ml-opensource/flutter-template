import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
    this.disabled = false,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final bool disabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          disabled
              ? context.colors.primary.withOpacity(.2)
              : backgroundColor ?? context.colors.primary,
        ),
        foregroundColor: MaterialStateProperty.all(
          foregroundColor ?? context.colors.accent,
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 52.0),
        ),
      ),
      child: !isLoading ? child : const CircularProgressIndicator(),
    );
  }
}
