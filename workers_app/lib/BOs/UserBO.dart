import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:workers_app/BOs/ProfileBO.dart';

@jsonSerializable
class UserBO {
  String id;
  String emailId;
  String fullName;
  String password;
  ProfileBO profile;
  UserBO({
    required this.emailId,
    required this.fullName,
    required this.id,
    required this.password,
    required this.profile,
  });
}
