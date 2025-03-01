// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String idKey = "idKey";
  static const String imageBaseURL = "lib/Helpers/Resources/Images/";
  static RegExp emailRegEx = RegExp(r"^[a-zA-Z0-9]+@gmail\.com$");
  static RegExp passwordRegEx =
      RegExp(r'^(?=.*[A-Z])(?=.*\d.*\d.*\d.*\d)(?=.*[\W_]).+$');
  static const String emailKey = "email";
  static const String passwordKey = "password";
  static const String listOfUsersKey = "listOfUsersKey";
  static const String listOfWorkersKey = "workersKey";
  static RegExp phoneNumberRegEx = RegExp(r'^(?:\|91|0)?[6789]\d{9}$');
}

enum Role { Owner, Worker }
