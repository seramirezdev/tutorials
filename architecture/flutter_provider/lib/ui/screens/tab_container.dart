import 'package:flutter/material.dart';
import 'package:flutter_provider/ui/screens/home_screen.dart';
import 'package:flutter_provider/ui/screens/login_screen.dart';

class TabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(

          children: <Widget>[
            LoginScreen(),
            HomeScreen()
          ],
        ),
      ),
    );
  }
}
