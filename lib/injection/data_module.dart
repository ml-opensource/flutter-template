import 'package:flutter_template/data/repository/auth_network_repository.dart';
import 'package:flutter_template/data/repository/auth_network_repository_impl.dart';
import 'package:flutter_template/data/repository/auth_storage_repository.dart';
import 'package:flutter_template/data/repository/auth_storage_repository_impl.dart';
import 'package:flutter_template/injection/injector.dart';

class DataModule {
  static Future<void> inject() async {
    // AuthRepository
    injector.registerLazySingleton<AuthStorageRepository>(
      () => AuthStorageRepositoryImpl(),
    );
    injector.registerLazySingleton<AuthNetworkRepository>(
      () => AuthNetworkRepositoryImpl(injector()),
    );
  }
}
