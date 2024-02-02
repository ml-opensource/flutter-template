import 'package:flutter_template/domain/entities/profile/profile_entity.dart';

abstract interface class ProfileService {
  Future<ProfileEntity> getProfile();
}
