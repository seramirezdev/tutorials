import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          emailField(),
          passField(),
          SizedBox(height: 20.0),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          // obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return Container(
          width: double.infinity,
          child: RaisedButton(
            shape: StadiumBorder(),
            onPressed: snapshot.hasData ? bloc.submit : null,
            color: Colors.lightBlue,
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
