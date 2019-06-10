import 'package:flutter_provider/core/services/api.dart';
import 'package:flutter_provider/core/services/authentication_service.dart';
import 'package:flutter_provider/core/viewmodels/comments_model.dart';
import 'package:flutter_provider/core/viewmodels/home_model.dart';
import 'package:flutter_provider/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
