// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../data/api/api_config.dart' as _i4;
import '../data/preferences/auth_preferences.dart' as _i14;
import '../data/preferences/user_shared_preferences.dart' as _i13;
import '../data/services/http_client/dio_http_client.dart' as _i9;
import '../data/services/http_client/http_client.dart' as _i8;
import '../data/services/http_profile_service.dart' as _i11;
import '../domain/services/profile_service.dart' as _i10;
import '../presentation/feature/profile/profile_cubit.dart' as _i15;
import '../presentation/feature/profile/profile_state.dart' as _i16;
import '../presentation/routes/app_navigator.dart' as _i5;
import '../presentation/routes/router.dart' as _i3;
import '../presentation/routes/router.gr.dart' as _i6;
import 'data_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dataModule = _$DataModule();
  gh.factory<_i3.$AppRouter>(() => _i3.$AppRouter());
  gh.factory<_i4.ApiConfig>(() => _i4.ApiConfig(get<String>()));
  gh.lazySingleton<_i5.AppNavigator>(
      () => _i5.AppNavigator(get<_i6.AppRouter>()));
  gh.factory<_i7.Dio>(() => dataModule.getDio(get<_i4.ApiConfig>()));
  gh.factory<_i8.HttpClient>(() => _i9.DioHttpClient(get<_i7.Dio>()));
  gh.lazySingleton<_i10.ProfileService>(() => _i11.HttpProfileService());
  gh.singletonAsync<_i12.SharedPreferences>(() => dataModule.prefs);
  gh.lazySingletonAsync<_i13.UserSharedPreferences>(() async =>
      _i13.UserSharedPreferences(await get.getAsync<_i12.SharedPreferences>()));
  gh.lazySingletonAsync<_i14.AuthPreferences>(() async =>
      _i14.AuthPreferences(await get.getAsync<_i12.SharedPreferences>()));
  gh.factoryParam<_i15.ProfileCubit, _i16.ProfileState?, dynamic>((state, _) =>
      _i15.ProfileCubit(
          profileService: get<_i10.ProfileService>(), state: state));
  return get;
}

class _$DataModule extends _i17.DataModule {}
