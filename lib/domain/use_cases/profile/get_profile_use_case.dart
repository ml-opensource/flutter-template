import 'package:flutter_template/domain/entities/profile/profile_entity.dart';
import 'package:flutter_template/domain/services/profile/profile_service.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetProfileUseCase {
  GetProfileUseCase(this._profileService);

  final ProfileService _profileService;

  Future<ProfileEntity> call() {
    return _profileService.getProfile();
  }
}
