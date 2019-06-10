import 'dart:async';

mixin Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Invalid email');
    }
  });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length > 3) {
      sink.add(pass);
    } else {
      sink.addError('The password must be at least 4 characters');
    }
  });
}
