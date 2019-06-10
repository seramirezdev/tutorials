import 'dart:async';

import 'package:flutter_provider/core/models/user.dart';
import 'package:flutter_provider/core/services/api.dart';
import 'package:flutter_provider/locator.dart';

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
