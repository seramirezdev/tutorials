import 'package:flutter_provider/core/enums/view_state.dart';
import 'package:flutter_provider/core/services/authentication_service.dart';
import 'package:flutter_provider/core/viewmodels/base_model.dart';
import 'package:flutter_provider/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errroMessage;

  Future<bool> login(String userIdText) async {
    bool success = false;
    errroMessage = '';

    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if (userId == null) {
      errroMessage = 'Value entered is not a number';
    } else {
      success = await _authenticationService.login(userId);
      if (!success) {
        errroMessage = 'Your credentials are incorrect';
      } else
        success = true;
    }

    setState(ViewState.Idle);
    return success;
  }
}
