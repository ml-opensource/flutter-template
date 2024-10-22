abstract interface class AssetsCachingManager {
  /// Caches only the animations required at the initial app startup,
  /// specifically for the splash screen.
  ///
  /// This method should be called before [runApp] to ensure that essential
  /// animations are loaded early, improving the user experience during
  /// the app's launch phase.
  ///
  /// By caching only necessary animations, this method reduces memory usage
  /// and improves performance.
  ///
  /// Typically invoked during app initialization to enhance startup efficiency.
  static Future<void> cacheAnimationsRoot() async {
    // Example:
    // try {
    //   await AssetLottie(Assets.animations.splash.path).load();
    // } catch (e) {
    //   // Nothing to do
    // }
  }
}
