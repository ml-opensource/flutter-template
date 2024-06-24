import 'package:dio/dio.dart';
import 'package:flutter_template/data/services/profile/dtos/profile_response.dart';
import 'package:flutter_template/injection/modules/network_module.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_remote_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class ProfileRemoteDataSource {
  @factoryMethod
  factory ProfileRemoteDataSource(
    @Named(dioAuthenticated) Dio dio,
  ) = _ProfileRemoteDataSource;

  @GET('/')
  Future<ProfileResponse> getProfile();
}
