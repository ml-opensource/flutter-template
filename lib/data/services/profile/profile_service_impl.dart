import 'package:flutter_template/data/services/profile/data_sources/remote/profile_remote_data_source.dart';
import 'package:flutter_template/data/services/profile/remapper/profile_remapper.dart';
import 'package:flutter_template/domain/entities/profile/profile_entity.dart';
import 'package:flutter_template/domain/services/profile/profile_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileService)
class ProfileServiceImpl implements ProfileService {
  ProfileServiceImpl(
    this._profileRemoteDataSource,
    this._profileRemapper,
  );

  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileRemapper _profileRemapper;

  @override
  Future<ProfileEntity> getProfile() async {
    final response = await _profileRemoteDataSource.getProfile();
    return _profileRemapper.fromResponse(
      response,
    );
  }
}
