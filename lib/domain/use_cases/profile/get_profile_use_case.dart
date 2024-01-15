import 'package:flutter_template/domain/services/profile/profile_service.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetProfileUseCase {
  GetProfileUseCase({required this.profileService});

  final ProfileService profileService;

  Future<String?> call() {
    return profileService.getProfileName();
  }
}
