enum AppFlavor { development, staging, production }

extension FlavorName on AppFlavor {
  String get name {
    switch (this) {
      case AppFlavor.development:
        return 'development';
      case AppFlavor.staging:
        return 'staging';
      case AppFlavor.production:
        return 'production';
    }
  }
}
