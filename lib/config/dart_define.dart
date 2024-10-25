// This class is declared as an `abstract final` to restrict inheritance
// and prevent instantiation outside the library.
abstract final class DartDefine {
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL');
}
