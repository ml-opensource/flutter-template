/// Generated by NStack, do not modify this file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:nstack/models/app_open_platform.dart';
import 'package:nstack/models/language.dart';
import 'package:nstack/models/localize_index.dart';
import 'package:nstack/models/nstack_config.dart';
import 'package:nstack/nstack.dart';
import 'package:nstack/partial/section_key_delegate.dart';

export 'package:nstack/models/app_open_platform.dart';

// Update this file by running:
// - `flutter pub run build_runner build`, if your package depends on Flutter
// - `pub run build_runner build` otherwise

class Localization {
  final defaultSection = const _DefaultSection();
  final error = const _Error();

  const Localization();
}

class _DefaultSection extends SectionKeyDelegate {
  const _DefaultSection() : super('default');

  String get cancel => get('cancel', "Cancel");
  String get ok => get('ok', "Ok");
  String get no => get('no', "No");
  String get yes => get('yes', "Yes");
  String get retry => get('retry', "Retry");
  String get edit => get('edit', "Edit");
  String get save => get('save', "Save");
  String get back => get('back', "Back");
  String get settings => get('settings', "Settings");
  String get later => get('later', "Later");
  String get next => get('next', "Next");
  String get previous => get('previous', "Previous");
  String get skip => get('skip', "Skip");
}

class _Error extends SectionKeyDelegate {
  const _Error() : super('error');

  String get authenticationError =>
      get('authenticationError', "Login expired, please login again.");
  String get connectionError =>
      get('connectionError', "No or bad connection, please try again.");
  String get errorTitle => get('errorTitle', "Error");
  String get unknownError =>
      get('unknownError', "Unknown error, please try again.");
}

const _config = NStackConfig(
    projectId: 'k78R0OadfzZQmlhvKYkF1znwdQYShK1SCiLl',
    apiKey: 'e5tzJcRuIE3UsivDicjQZlI03TLgpWPEroOf');

final _languages = [
  LocalizeIndex(
      id: 1372,
      url: null,
      lastUpdatedAt: null,
      shouldUpdate: false,
      language: Language(
          id: 11,
          name: 'English (UK)',
          locale: 'en-GB',
          direction: 'LRM',
          isDefault: true,
          isBestFit: true)),
  LocalizeIndex(
      id: 1373,
      url: null,
      lastUpdatedAt: null,
      shouldUpdate: false,
      language: Language(
          id: 34,
          name: 'Dutch',
          locale: 'nl-NL',
          direction: 'LRM',
          isDefault: false,
          isBestFit: false)),
];

const _bundledTranslations = {
  'en-GB':
      r'''{"data":{"default":{"cancel":"Cancel","ok":"Ok","no":"No","yes":"Yes","retry":"Retry","edit":"Edit","save":"Save","back":"Back","settings":"Settings","later":"Later","next":"Next","previous":"Previous","skip":"Skip"},"error":{"authenticationError":"Login expired, please login again.","connectionError":"No or bad connection, please try again.","errorTitle":"Error","unknownError":"Unknown error, please try again."}},"meta":{"language":{"id":11,"name":"English (UK)","locale":"en-GB","direction":"LRM","is_default":false,"is_best_fit":false},"platform":{"id":564,"slug":"mobile"}}}''',
  'nl-NL':
      r'''{"data":{"default":{"cancel":"__cancel","ok":"__ok","no":"__no","yes":"__yes","retry":"__retry","edit":"__edit","save":"__save","back":"__back","settings":"__settings","later":"__later","next":"__next","previous":"__previous","skip":"__skip"},"error":{"authenticationError":"__authenticationError","connectionError":"__connectionError","errorTitle":"__errorTitle","unknownError":"__unknownError"}},"meta":{"language":{"id":34,"name":"Dutch","locale":"nl-NL","direction":"LRM","is_default":false,"is_best_fit":false},"platform":{"id":564,"slug":"mobile"}}}''',
};

final _nstack = NStack<Localization>(
    config: _config,
    localization: const Localization(),
    availableLanguages: _languages,
    bundledTranslations: _bundledTranslations,
    pickedLanguageLocale: '',
    debug: kDebugMode);

class NStackScope extends InheritedWidget {
  final NStack<Localization> nstack;
  final NStackState state;
  final String checksum;

  NStackScope(
      {Key? key,
      required Widget child,
      required this.state,
      required this.nstack,
      required this.checksum})
      : super(key: key, child: child);

  static NStackState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NStackScope>()!.state;

  @override
  bool updateShouldNotify(NStackScope oldWidget) =>
      checksum != oldWidget.checksum;
}

class NStackWidget extends StatefulWidget {
  final Widget child;
  final AppOpenPlatform? platformOverride;
  final VoidCallback? onComplete;

  const NStackWidget(
      {Key? key, required Widget child, this.platformOverride, this.onComplete})
      : child = child,
        super(key: key);

  @override
  NStackState createState() => NStackState();
}

class NStackState extends State<NStackWidget> {
  final NStack<Localization> nstack = _nstack;
  bool _initializedNStack = false;

  late Future<bool> _nstackInitFuture;

  @override
  void initState() {
    super.initState();
    _nstackInitFuture = _nstack.init();
  }

  changeLanguage(Locale locale) async {
    await _nstack
        .changeLocalization(locale)
        .whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (!_initializedNStack) {
      _nstack
          .appOpen(Localizations.localeOf(context),
              platformOverride: widget.platformOverride)
          .whenComplete(() => widget.onComplete?.call());
      _initializedNStack = true;
    }

    return FutureBuilder(
        future: _nstackInitFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return NStackScope(
              child: widget.child,
              state: this,
              nstack: this.nstack,
              checksum: nstack.checksum,
            );
          } else {
            return SizedBox();
          }
        });
  }
}

/// Allows to access the Nstack Localization using the BuildContext
extension NStackWidgetExtension on BuildContext {
  Localization get localization => NStackScope.of(this).nstack.localization;
}

/// Allows to access the Nstack Localization from StatefulWidget's State
extension NStackStateExtension<T extends StatefulWidget> on State<T> {
  Localization get localization => context.localization;
}