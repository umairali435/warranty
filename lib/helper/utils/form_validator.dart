import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/helper/extensions/string_extenstion.dart';

class FormValidator {
  FormValidator._();
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return Constants.emptyEmailInputError;
    } else if (!email.isValidEmail) {
      return Constants.invalidEmailError;
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return Constants.nameInputEmptyError;
    } else if (name.length < 3) {
      return Constants.nameLengthInputEmptyError;
    }
    return null;
  }

  static String? datevalidator(String? date) {
    if (date == null || date.isEmpty) {
      return Constants.dateInputEmptyError;
    }
    return null;
  }

  static String? timevalidator(String? time) {
    if (time == null || time.isEmpty) {
      return Constants.warrantyInputEmptyError;
    }
    return null;
  }

  static String? clainvalidator(String? time) {
    if (time == null || time.isEmpty) {
      return Constants.calimInputEmptyError;
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return Constants.emptyPasswordInputError;
    } else if (password.length < 6) {
      return Constants.passwordgreaterthansix;
    }
    return null;
  }
}
