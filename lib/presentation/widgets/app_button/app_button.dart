import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/widgets/app_button/ui/app_secondary_button.dart';
import 'package:flutter_template/presentation/widgets/app_button/ui/app_primary_button.dart';

enum ButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final ButtonType buttonType;
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final bool isLoading;
  final bool disabled;

  const AppButton._({
    Key? key,
    required this.buttonType,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.isLoading = false,
    this.disabled = false,
  }) : super(key: key);

  factory AppButton.primary({
    required VoidCallback? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    bool isLoading = false,
    bool disabled = false,
  }) {
    return AppButton._(
      buttonType: ButtonType.primary,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      isLoading: isLoading,
      disabled: disabled,
      child: child,
    );
  }

  factory AppButton.secondary({
    required VoidCallback? onPressed,
    required Widget child,
    Color? borderColor,
    bool isLoading = false,
    bool disabled = false,
  }) {
    return AppButton._(
      buttonType: ButtonType.secondary,
      onPressed: onPressed,
      borderColor: borderColor,
      isLoading: isLoading,
      disabled: disabled,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;

    switch (buttonType) {
      case ButtonType.primary:
        child = AppPrimaryButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          isLoading: isLoading,
          disabled: disabled,
          child: this.child,
        );
        break;
      case ButtonType.secondary:
        child = AppSecondaryButton(
          onPressed: onPressed,
          borderColor: borderColor,
          isLoading: isLoading,
          disabled: disabled,
          child: this.child,
        );
        break;
      default:
        child = const SizedBox.shrink();
        break;
    }

    return child;
  }
}
