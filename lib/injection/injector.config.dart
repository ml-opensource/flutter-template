// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i19;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../data/api/api_config.dart' as _i4;
import '../data/api/auth_token_storage/auth_token_storage.dart' as _i16;
import '../data/api/auth_token_storage/secure_auth_token_storage.dart' as _i17;
import '../data/api/authenticator/authenticator.dart' as _i18;
import '../data/api/interceptors/api_auth_interceptor.dart' as _i22;
import '../data/api/interceptors/meta_interceptor.dart' as _i10;
import '../data/preferences/user_shared_preferences.dart' as _i15;
import '../data/services/http_client/dio_http_client.dart' as _i8;
import '../data/services/http_profile_service.dart' as _i13;
import '../domain/services/profile_service.dart' as _i12;
import '../presentation/app_flavor.dart' as _i11;
import '../presentation/application_config.dart' as _i5;
import '../presentation/feature/profile/profile_cubit.dart' as _i20;
import '../presentation/feature/profile/profile_state.dart' as _i21;
import '../presentation/routes/app_navigator.dart' as _i6;
import '../presentation/routes/router.dart' as _i3;
import '../presentation/routes/router.gr.dart' as _i7;
import 'data_module.dart' as _i24;
import 'network_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final dataModule = _$DataModule();
  gh.factory<_i3.$AppRouter>(() => _i3.$AppRouter());
  gh.lazySingleton<_i4.ApiConfig>(
      () => _i4.ApiConfig(get<_i5.ApplicationConfig>()));
  gh.lazySingleton<_i6.AppNavigator>(
      () => _i6.AppNavigator(get<_i7.AppRouter>()));
  gh.singleton<_i8.DioHttpClient>(
      networkModule.getAuthDioClient(get<_i4.ApiConfig>()),
      instanceName: 'AUTHDIOCLIENT');
  gh.singleton<_i9.FlutterSecureStorage>(dataModule.secureStorage);
  gh.factory<_i10.MetaInterceptor>(
      () => _i10.MetaInterceptor(get<_i11.AppFlavor>()));
  gh.lazySingleton<_i12.ProfileService>(() => _i13.HttpProfileService());
  await gh.singletonAsync<_i14.SharedPreferences>(() => dataModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i15.UserSharedPreferences>(
      () => _i15.UserSharedPreferences(get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i16.AuthTokenStorage>(
      () => _i17.SecureAuthTokenStorage(get<_i9.FlutterSecureStorage>()));
  gh.lazySingleton<_i18.Authenticator>(() => _i18.Authenticator(
      get<_i16.AuthTokenStorage>(),
      get<_i8.DioHttpClient>(instanceName: 'AUTHDIOCLIENT'),
      get<_i4.ApiConfig>()));
  gh.singleton<_i19.Dio>(
      networkModule.getAuthDio(
          get<_i4.ApiConfig>(), get<_i10.MetaInterceptor>()),
      instanceName: 'AUTH');
  gh.factoryParam<_i20.ProfileCubit, _i21.ProfileState?, dynamic>((state, _) =>
      _i20.ProfileCubit(
          profileService: get<_i12.ProfileService>(), state: state));
  gh.factory<_i22.ApiAuthInterceptor>(() => _i22.ApiAuthInterceptor(
      get<_i19.Dio>(instanceName: 'AUTH'), get<_i18.Authenticator>()));
  gh.singleton<_i19.Dio>(
      networkModule.getRegularDio(
          get<_i4.ApiConfig>(),
          get<_i18.Authenticator>(),
          get<_i22.ApiAuthInterceptor>(),
          get<_i10.MetaInterceptor>()),
      instanceName: 'REGULAR');
  return get;
}

class _$NetworkModule extends _i23.NetworkModule {}

class _$DataModule extends _i24.DataModule {}
