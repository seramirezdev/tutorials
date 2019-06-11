import 'package:flutter/material.dart';
import 'package:flutter_provider/core/enums/view_state.dart';
import 'package:flutter_provider/core/viewmodels/login_model.dart';
import 'package:flutter_provider/ui/screens/base_screen.dart';
import 'package:flutter_provider/ui/shared/app_colors.dart' as colorsApp;
import 'package:flutter_provider/ui/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginModel>(
      onModelReady: (model) {/* Call something on the model. */},
      builder: (context, model, child) => Scaffold(
            backgroundColor: colorsApp.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(
                  controller: _editingController,
                  validationMessage: model.errroMessage,
                ),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_editingController.text);

                          if (loginSuccess) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      )
              ],
            ),
          ),
    );
  }
}
