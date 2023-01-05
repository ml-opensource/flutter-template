import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticator_exception.freezed.dart';

@freezed
class AuthenticatorException
    with _$AuthenticatorException
    implements Exception {
  const factory AuthenticatorException.unauthorized() = _Unauthorized;
  const factory AuthenticatorException.noRefreshToken() = _NoRefreshToken;
  const factory AuthenticatorException.reauthenticationFailed() =
      _ReauthenticationFailed;
}
