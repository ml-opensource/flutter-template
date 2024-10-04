// This class is declared as an `abstract interface` to restrict inheritance
// and prevent instantiation outside the library.
abstract interface class DartDefine {
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL');
}
