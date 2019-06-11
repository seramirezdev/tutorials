import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/core/models/user.dart';
import 'package:flutter_provider/core/services/authentication_service.dart';
import 'package:flutter_provider/locator.dart';
import 'package:flutter_provider/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().user,
      child: MaterialApp(
        title: 'Flutter Provider',
        theme: ThemeData(),
        initialRoute: Router.initialRoute,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
