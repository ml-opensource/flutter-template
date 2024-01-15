import 'package:flutter_template/data/response_objects/response_error.dart';
import 'package:flutter_template/nstack/nstack.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

///The BE should provide one unique code for each error, in this case the
///error is being provided through errorName so we create an Enum for each
///code we are aware of with a default value to unknown
@freezed
class APIError with _$APIError {
  const factory APIError({
    required String? requestId,
    required String? timestamp,
    required int statusCode,
    required String message,
    required String localizedMessage,
    @JsonKey(unknownEnumValue: ErrorName.unknown) required ErrorName errorName,
    required String? path,
  }) = _APIError;

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);
}

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    //TODO: name this according to the map key from the error response
    //if no map key exists then just create this factory with the APIError values
    //and remove APIError,
    required APIError error,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

enum ErrorName {
  //Add error enum and the BE value
  @JsonValue('errorExample')
  errorExample,
  unknown,
}

//*************** Extensions ***************/

extension ErrorResponseExtensions on ErrorResponse {
  ResponseError getResponseErrorType() {
    return ResponseError.badRequest(error.errorName);
  }
}

extension ErrorNameExtensions on ErrorName {
  String getErrorMessage(Localization l10n) {
    switch (this) {
      //Handle error enum and return mapped nstack vlaue
      case ErrorName.errorExample:
        return l10n.error.authenticationError;
      default:
        return '';
    }
  }
}
