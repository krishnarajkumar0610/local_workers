import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserBO {
  int id;
  String fullName;
  String emailId;
  String password;
  UserBO({
    required this.id,
    required this.emailId,
    required this.fullName,
    required this.password,
  });
}
