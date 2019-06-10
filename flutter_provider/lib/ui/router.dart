import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/core/models/post.dart';
import 'package:flutter_provider/ui/screens/home_screen.dart';
import 'package:flutter_provider/ui/screens/login_screen.dart';
import 'package:flutter_provider/ui/screens/post_screen.dart';

class Router {
  static final String initialRoute = 'login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => PostScreen(
                  post: post,
                ));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text(
                    'No route defined for ${settings.name}',
                  ),
                )));
    }
  }
}
