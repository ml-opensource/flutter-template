import 'package:flutter_template/injection/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt injector = GetIt.I;

@injectableInit
Future<void> configureDependencies() => injector.init();
