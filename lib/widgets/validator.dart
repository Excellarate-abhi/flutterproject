import 'dart:async';

mixin validators {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty) {
      return sink.addError("This field can't be empty ");
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return sink.addError("Please Enter a Valid Email");
    } else {
      sink.add(email);
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty) {
      return sink.addError("This field can't be empty ");
    } else {
      sink.add(password);
    }
  });

  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty) {
      return sink.addError("This field can't be empty ");
    }
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(name)) {
      return sink.addError("Please Enter a Valid Name");
    } else {
      sink.add(name);
    }
  });

  var phoneValidator =
  StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.isEmpty) {
      return sink.addError("This field can't be empty ");
    }
    if (phone.length > 10) {
      return sink.addError("Phone Number cannot be more than 10 digits");
    }
    if (phone.length < 10) {
      return sink.addError("Phone Number cannot be less than 10 digits");
    }
    if (!RegExp(r'[0-9]{10}').hasMatch(phone)) {
      return sink.addError("Please Enter a Valid Phone Number");
    } else {
      sink.add(phone);
    }
  });


}
