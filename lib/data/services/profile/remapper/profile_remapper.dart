import 'package:flutter_template/data/services/profile/dtos/profile_response.dart';
import 'package:flutter_template/domain/entities/profile/profile_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileRemapper {
  ProfileEntity fromResponse(ProfileResponse response) {
    final personName = response.results?.first.name;

    return ProfileEntity(
      firstName: personName?.first ?? '',
      lastName: personName?.last ?? '',
    );
  }
}
