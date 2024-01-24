import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_template/presentation/resources/app_colors.dart';
import 'package:flutter_template/presentation/resources/app_ui_constants.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';
import 'package:flutter_template/presentation/widgets/app_bar/top_app_bar.dart';
import 'package:flutter_template/presentation/widgets/button/app_button.dart';
import 'package:flutter_template/presentation/widgets/spacers/safe_area_spacer.dart';
import 'package:flutter_template/presentation/widgets/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/utilities/app_screen_config.dart';

/// A playground screen designed for showcasing reusable widgets.
///
/// This screen is intended for presenting and testing reusable widgets within
/// the context of a Flutter application.
///
/// If you need to extract some small widgets only for this playground screen,
/// consider using the private modifier for widget classes.
@RoutePage()
class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const verticalGap = SizedBox(height: 12);
    const sliverGap = SliverToBoxAdapter(
      child: verticalGap,
    );

    return AppScreenConfig(
      child: Scaffold(
        appBar: const TopAppBar(
          label: 'Playground',
        ),
        body: CustomScrollView(
          slivers: [
            _PlaygroundStickyHeader(
              label: 'Color Boxes',
              child: Wrap(
                children: [
                  _PlaygroundColorBox(
                    label: 'Primary',
                    color: context.colors.primary,
                    labelColor: context.colors.foregroundOnPrimary,
                  ),
                  _PlaygroundColorBox(
                    label: 'Secondary',
                    color: context.colors.secondary,
                    labelColor: context.colors.foregroundOnSecondary,
                  ),
                  _PlaygroundColorBox(
                    label: 'Background',
                    color: context.colors.background,
                    labelColor: context.colors.foregroundOnBackground,
                  ),
                  _PlaygroundColorBox(
                    label: 'Danger',
                    color: context.colors.danger,
                    labelColor: context.colors.foregroundOnDanger,
                  ),
                  _PlaygroundColorBox(
                    label: 'Outline',
                    color: context.colors.outline,
                    labelColor: context.colors.foregroundOnPrimary,
                  ),
                  _PlaygroundColorBox(
                    label: 'Primary Variant',
                    color: context.colors.primaryVariant,
                    labelColor: context.colors.foregroundOnPrimary,
                  ),
                  _PlaygroundColorBox(
                    label: 'Secondary Variant',
                    color: context.colors.secondaryVariant,
                    labelColor: context.colors.foregroundOnSecondary,
                  ),
                  _PlaygroundColorBox(
                    label: 'Splash',
                    color: context.colors.splashColor,
                    labelColor: context.colors.foregroundOnBackground,
                  ),
                ],
              ),
            ),
            sliverGap,
            _PlaygroundStickyHeader(
              label: 'Buttons',
              child: Column(
                children: [
                  AppButton.primary(
                    label: 'Primary Button',
                    onPressed: () {},
                  ),
                  verticalGap,
                  AppButton.secondary(
                    label: 'Secondary Button',
                    onPressed: () {},
                  ),
                  verticalGap,
                  AppButton.outlined(
                    label: 'Outlined Button',
                    onPressed: () {},
                  ),
                  verticalGap,
                  AppButton.destructive(
                    label: 'Destructive Button',
                    onPressed: () {},
                  ),
                  verticalGap,
                  AppButton.text(
                    label: 'Text Button',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            sliverGap,
            _PlaygroundStickyHeader(
              label: 'Small Buttons',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppButton.primary(
                          label: 'Small Primary Button',
                          isSmall: true,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppButton.secondary(
                          label: 'Small Secondary Button',
                          isSmall: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sliverGap,
            _PlaygroundStickyHeader(
              label: 'Texts',
              child: Column(
                children: [
                  AppText.header1('Header 1'),
                  verticalGap,
                  AppText.header2('Header 2'),
                  verticalGap,
                  AppText.header3('Header 3'),
                  verticalGap,
                  AppText.bodySmall('This is Body (small).'),
                  verticalGap,
                  AppText.body('This is Body (regular).'),
                  verticalGap,
                  AppText.bodyLarge('This is Body (large).'),
                  verticalGap,
                  AppText.buttonLabel('This is Button label.'),
                  verticalGap,
                  AppText.underlineText('This is underlined text.'),
                  verticalGap,
                  AppText.custom(
                    'This is custom',
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 72,
              ),
            ),
            const SliverToBoxAdapter(
              child: SafeAreaSpacer(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaygroundStickyHeader extends StatelessWidget {
  const _PlaygroundStickyHeader({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: ColoredBox(
        color: context.colors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ).copyWith(bottom: 12.0),
          child: AppText.header3(label),
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: AppUiConstants.defaultScreenHorizontalPadding,
          child: child,
        ),
      ),
    );
  }
}

class _PlaygroundColorBox extends StatelessWidget {
  const _PlaygroundColorBox({
    required this.label,
    required this.color,
    required this.labelColor,
  });

  final String label;
  final Color color;
  final Color labelColor;

  final boxSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: boxSize,
        height: boxSize,
        color: color,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText.body(
              label,
              textAlign: TextAlign.center,
              color: labelColor,
            ),
          ),
        ),
      ),
    );
  }
}

class PlaygroundScreenOpenerButton extends StatelessWidget {
  const PlaygroundScreenOpenerButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      return const SizedBox.shrink();
    }

    return AppButton.text(
      label: 'Open Playground Screen',
      onPressed: () => context.pushRoute(
        const PlaygroundRoute(),
      ),
    );
  }
}
