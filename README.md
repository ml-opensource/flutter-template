# App name - Flutter

## 📖 Project description

This project serves as a template project for Flutter applications. You can generate a new repository by clicking "Use this template" above.

## 🔧 Setup and Installation

1. Execute `$ flutter doctor` to verify installations.
2. Execute `$ pub get` to pull project dependencies.
3. Execute a run configuration of your choice:

   ```sh
   flutter run --flavor development -t lib/main_development.dart --dart-define-from-file=lib/config/dart_define_keys/dart_define_development_keys.json
   ```

   ```sh
   flutter run --flavor staging -t lib/main_staging.dart --dart-define-from-file=lib/config/dart_define_keys/dart_define_staging_keys.json`
   ```

> [!IMPORTANT]
> ⚠️ **Running the Production Flavor**
>
> It is **not recommended** to run the production flavor directly from the IDE
> (VS Code or Android Studio) as it may be run by mistake. For ease and
> accuracy,
> it is advised to run flavors via the **VS Code launch menu** or the
> **Android Studio Run menu** instead.
>
> To use the build runner, use this command:
>
> ```sh
> dart run build_runner build --delete-conflicting-outputs
> ```

## 🌲 Branches

- `main` - Latest version in the app store.
- `develop` - Default. Feature branches are merged in when complete and then deleted.

## 🔗 Useful links

- [Jira Board](https://TODO)
- [Confluence](https://TODO)
- [Slack Channel](https://TODO)
- [OpenAPI Specification](https://TODO)
- [NStack](https://TODO)
- [Figma Design](https://TODO)
