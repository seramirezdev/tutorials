import 'dart:async';

import 'package:flutter_provider_no_get_it/core/models/user.dart';
import 'package:flutter_provider_no_get_it/core/services/api.dart';
import 'package:flutter_provider_no_get_it/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
