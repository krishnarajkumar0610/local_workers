import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ProfileBO {
  String profileImg;
  String phoneNumber;
  String experience;
  String description;
  String jobTitle;
  String age;
  ProfileBO({
    required this.age,
    required this.description,
    required this.experience,
    required this.jobTitle,
    required this.phoneNumber,
    required this.profileImg,
  });
}
