import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart' as validators;

class AppValidator {
  // text validation
  String emptyName = 'Name is requird';
  String emptyEmail = 'Email is requird';
  String emptyPhone = 'phone is requird';
  String emptyPass = 'Password is requird';
  String emptyConfiremPass = 'Confirem password is requird';
  String errorEmail = 'Wrong email ,please enter valid email';
  String errorPhone = 'Wrong phone number ,please enter valid phone number';
  // Function Validation
  String? isEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return emptyEmail;
    } else if (!EmailValidator.validate(value!)) {
      return errorEmail;
    }
    return null;
  }

  String? isPhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return emptyPhone;
    } else if (!validators.isLength(
          value!.trim(),
          10,
        ) ||
        !(value.trim().startsWith('077') ||
            value.trim().startsWith('078') ||
            value.trim().startsWith('079'))) {
      return errorPhone;
    }
    return null;
  }

  String? isName(String? value) {
    if (value?.isEmpty ?? true) {
      return emptyName;
    }
    return null;
  }
}
