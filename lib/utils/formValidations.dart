import 'package:flutter_form_bloc/flutter_form_bloc.dart';

final phoneRegex = RegExp('^9[0-9]{8}\$');
final expirationDateRegex = RegExp('^[0-9]{2}/[0-9]{2}\$');

String Function(String) haveLength(int length, String message) {
  return (val) {
    if (val == null || val.length != length) {
      return message;
    }
    return null;
  };
}

String Function(dynamic) isRequired(dynamic message) {
  return (val) {
    return FieldBlocValidators.required(val) != null ? message : null;
  };
}

String Function(String) isEmail(String message) {
  return (val) {
    return FieldBlocValidators.email(val) != null ? message : null;
  };
}

String Function(String) minLength<T>(int length, String message) {
  return (val) {
    return val.length >= length ? null : message;
  };
}

String Function(List<T>) minLengthList<T>(int length, String message) {
  return (val) {
    return val.length >= length ? null : message;
  };
}

String Function(String) isValidPhone(String message) {
  return (val) {
    if (val == null || val.isEmpty || phoneRegex.hasMatch(val)) {
      return null;
    }
    return message;
  };
}

String Function(String) isRegex(RegExp regex, String message) {
  return (val) {
    if (val == null || val.isEmpty || regex.hasMatch(val)) {
      return null;
    }
    return message;
  };
}
