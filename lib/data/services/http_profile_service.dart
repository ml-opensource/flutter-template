import 'package:flutter_template/domain/services/profile_service.dart';

class HttpProfileService extends ProfileService {
  HttpProfileService();


  @override
  Future<String?> getProfileName() async {
    // TODO: implement getProfileName
    await Future.delayed(Duration(milliseconds: 800));
    return "Michael Laudrup";
  }
}
