import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_no_get_it/core/models/user.dart';
import 'package:flutter_provider_no_get_it/core/services/authentication_service.dart';
import 'package:flutter_provider_no_get_it/locator.dart';
import 'package:flutter_provider_no_get_it/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.controller(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Provider',
        theme: ThemeData(),
        initialRoute: Router.initialRoute,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
