import 'package:flutter_template/data/services/http_client/http_client.dart';
import 'package:flutter_template/domain/services/profile_service.dart';

class HttpProfileService extends ProfileService {
  HttpProfileService(this._httpClient);

  final HttpClient _httpClient;

  @override
  Future<String?> getProfileName() async {
    // TODO: implement getProfileName
    await Future.delayed(Duration(milliseconds: 800));
    return "Michael Laudrup";
  }
}
