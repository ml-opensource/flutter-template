import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileService)
class HttpProfileService extends ProfileService {
  HttpProfileService();

  @override
  Future<String?> getProfileName() async {
    // TODO: implement getProfileName
    await Future.delayed(const Duration(milliseconds: 800));
    return 'Michael Laudrup';
  }
}
