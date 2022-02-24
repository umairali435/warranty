import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class Constants {
  const Constants._();
  static const primaryColor = Colors.lightBlueAccent;
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF8F8F8F);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color textFieldHintColor = Color(0xFF202C43);
  static const Color redColor = Color(0xFFed0000);
  static const Color darkSkeletonColor = Color(0xFF656565);
  static const Color lightSkeletonColor = Colors.grey;
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );
  static TextStyle poppinsFont = GoogleFonts.poppins().copyWith(
    color: black,
  );
  static TextStyle monstrat = GoogleFonts.montserrat().copyWith(
    color: black,
  );
  static const invalidEmailError = 'Please enter a valid email address';
  static const emptyPasswordInputError = 'Please enter a password';
  static const passwordgreaterthansix =
      'Password must be greater than 6 character';
  static const emptyEmailInputError = 'Please enter an email';
  static const nameInputEmptyError = "Name can not be empty";
  static const dateInputEmptyError = "Purchase Date can not be empty";
  static const warrantyInputEmptyError = "Warranty Time can not be empty";
  static const calimInputEmptyError = "Claim Time can not be empty";
  static const nameLengthInputEmptyError = "Name Length can not be less than 3";
}
