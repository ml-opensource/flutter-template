import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/extensions/color_extensions.dart';
import 'package:flutter_template/presentation/resources/app_colors.dart';
import 'package:flutter_template/presentation/resources/app_ui_constants.dart';
import 'package:flutter_template/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:flutter_template/presentation/widgets/text/app_text.dart';

enum _AppButtonType {
  primary,
  secondary,
  outlined,
  text,
  danger,
}

class AppButton extends StatelessWidget {
  const AppButton._({
    Key? key,
    required this.buttonType,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isSmall = false,
    this.isDisabled = false,
  }) : super(key: key);

  factory AppButton.primary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool isSmall = false,
    bool isDisabled = false,
  }) {
    return AppButton._(
      buttonType: _AppButtonType.primary,
      label: label,
      isLoading: isLoading,
      isSmall: isSmall,
      isDisabled: isDisabled,
      onPressed: onPressed,
    );
  }

  factory AppButton.secondary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool isSmall = false,
    bool isDisabled = false,
  }) {
    return AppButton._(
      buttonType: _AppButtonType.secondary,
      label: label,
      isLoading: isLoading,
      isSmall: isSmall,
      isDisabled: isDisabled,
      onPressed: onPressed,
    );
  }

  factory AppButton.outlined({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool isSmall = false,
    bool isDisabled = false,
  }) {
    return AppButton._(
      buttonType: _AppButtonType.outlined,
      label: label,
      isLoading: isLoading,
      isSmall: isSmall,
      isDisabled: isDisabled,
      onPressed: onPressed,
    );
  }

  factory AppButton.text({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool isSmall = false,
    bool isDisabled = false,
  }) {
    return AppButton._(
      buttonType: _AppButtonType.text,
      label: label,
      isLoading: isLoading,
      isSmall: isSmall,
      isDisabled: isDisabled,
      onPressed: onPressed,
    );
  }

  factory AppButton.destructive({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool isSmall = false,
    bool isDisabled = false,
  }) {
    return AppButton._(
      buttonType: _AppButtonType.danger,
      label: label,
      isLoading: isLoading,
      isSmall: isSmall,
      isDisabled: isDisabled,
      onPressed: onPressed,
    );
  }

  final _AppButtonType buttonType;
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isSmall;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final borderRadius = AppUiConstants.defaultBorderRadius;

    final _colors = context.colors;

    final _padding = isSmall
        ? AppUiConstants.defaultSmallButtonContentPadding
        : AppUiConstants.defaultButtonContentPadding;

    final _textStyle = isSmall
        ? AppUiConstants.defaultSmallButtonTextStyle
        : AppUiConstants.defaultButtonTextStyle;

    final shape = borderRadius == null
        ? null
        : MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppUiConstants.defaultBorderRadius ?? .0,
              ),
            ),
          );

    final disableOnPressed = isLoading || isDisabled;

    return SizedBox(
      width: double.infinity,
      child: switch (buttonType) {
        _AppButtonType.primary => TextButton(
            style: TextButton.styleFrom(
              padding: _padding,
              textStyle: _textStyle,
              backgroundColor:
                  isDisabled ? _colors.primary.lowOpacity() : _colors.primary,
              foregroundColor: _colors.foregroundOnPrimary,
            ).copyWith(
              shape: shape,
            ),
            onPressed: disableOnPressed ? null : onPressed,
            child: isLoading
                ? AppLoadingIndicator.small(
                    indicatorColor: _colors.foregroundOnPrimary,
                  )
                : _AppButtonLabel(label),
          ),
        _AppButtonType.secondary => TextButton(
            style: TextButton.styleFrom(
              padding: _padding,
              textStyle: _textStyle,
              backgroundColor: isDisabled
                  ? _colors.secondary.lowOpacity()
                  : _colors.secondary,
              foregroundColor: _colors.foregroundOnSecondary,
            ).copyWith(
              shape: shape,
            ),
            onPressed: disableOnPressed ? null : onPressed,
            child: isLoading
                ? AppLoadingIndicator.small(
                    indicatorColor: _colors.foregroundOnSecondary,
                  )
                : _AppButtonLabel(label),
          ),
        _AppButtonType.outlined => OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: _padding,
              textStyle: _textStyle,
            ).copyWith(
              shape: shape,
            ),
            onPressed: disableOnPressed ? null : onPressed,
            child: isLoading
                ? AppLoadingIndicator.small(
                    indicatorColor: _colors.foregroundOnBackground,
                  )
                : _AppButtonLabel(label),
          ),
        _AppButtonType.text => TextButton(
            style: TextButton.styleFrom(
              padding: _padding,
              textStyle: _textStyle,
            ).copyWith(
              shape: shape,
            ),
            onPressed: disableOnPressed ? null : onPressed,
            child: isLoading
                ? AppLoadingIndicator.small(
                    indicatorColor: _colors.foregroundOnBackground,
                  )
                : _AppButtonLabel(label),
          ),
        _AppButtonType.danger => TextButton(
            style: TextButton.styleFrom(
              padding: _padding,
              textStyle: _textStyle,
              backgroundColor:
                  isDisabled ? _colors.danger.lowOpacity() : _colors.danger,
              foregroundColor: _colors.foregroundOnDanger,
            ).copyWith(
              shape: shape,
            ),
            onPressed: disableOnPressed ? null : onPressed,
            child: isLoading
                ? AppLoadingIndicator.small(
                    indicatorColor: _colors.foregroundOnDanger,
                  )
                : _AppButtonLabel(label),
          ),
      },
    );
  }
}

class _AppButtonLabel extends StatelessWidget {
  const _AppButtonLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppText.buttonLabel(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}
