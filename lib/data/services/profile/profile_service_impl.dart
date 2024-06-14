import 'package:flutter_template/domain/services/profile/profile_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileService)
class ProfileServiceImpl implements ProfileService {
  @override
  Future<String?> getProfileName() async {
    // TODO: implement getProfileName
    await Future.delayed(const Duration(milliseconds: 800));
    return 'John Doe';
  }
}
