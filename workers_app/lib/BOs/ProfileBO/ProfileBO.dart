import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ProfileBO {
  String profileImg;
  String phoneNumber;
  String description;
  int experience;
  int age;
  ProfileBO({
    required this.profileImg,
    required this.description,
    required this.age,
    required this.experience,
    required this.phoneNumber,
  });
}
