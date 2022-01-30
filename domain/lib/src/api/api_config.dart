import 'package:domain/domain.dart';

class ApiConfig {
  final AppFlavor _flavor;

  ApiConfig(this._flavor);

  String get serverDomain {
    switch (_flavor) {
      case AppFlavor.staging:
        return 'staging-api-domain-here';
      case AppFlavor.production:
        return 'production-api-domain-here';
      case AppFlavor.development:
        return 'development-api-domain-here';
    }
  }

  String get apiUrl => 'https://$serverDomain/api';
}