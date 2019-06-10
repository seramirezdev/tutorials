import 'package:flutter_provider_no_get_it/core/services/api.dart';
import 'package:flutter_provider_no_get_it/core/services/authentication_service.dart';
import 'package:flutter_provider_no_get_it/core/viewmodels/comments_model.dart';
import 'package:flutter_provider_no_get_it/core/viewmodels/home_model.dart';
import 'package:flutter_provider_no_get_it/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
