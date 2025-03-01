import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:workers_app/Services/SecureStorageService/ISecureStorageService.dart';
part 'ProfileScreenModel.g.dart';

class ProfileScreenModel = _ProfileScreenModelBase with _$ProfileScreenModel;

abstract class _ProfileScreenModelBase with Store {
  ISecureStorageService secureStorageService =
      GetIt.instance.get<ISecureStorageService>();
  @observable
  late String imagepath;
  @observable
  late String email;
  @observable
  late String password;
  @observable
  late String fullName;
  @observable
  late String phoneNumber;
  @observable
  late String experience;
  @observable
  late String age;
  @observable
  late String description;
  @observable
  late String jobTitle;
  @observable
  late String jobTitleErrorMessage;
  @observable
  late String descriptionErrorMessage;
  @observable
  late String phoneNumberErrorMessage;
  @observable
  late String experienceErrorMessage;
  @observable
  late String ageErrorMessage;
  @observable
  late String selectedRole;
  @observable
  late bool isLoading;
  @observable
  late bool isValidUser;

  @action
  void setIsValidUser(bool value) {
    isValidUser = value;
  }

  @action
  void setJobTitleErrorMessage(String value) {
    jobTitleErrorMessage = value;
  }

  @action
  void setJobTitle(String value) {
    jobTitle = value;
  }

  @action
  void setDescriptionErrorMessage(String value) {
    descriptionErrorMessage = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setFullName(String value) {
    fullName = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setSelectedRole(String value) {
    selectedRole = value;
  }

  @action
  void setImagepath(String value) {
    imagepath = value;
  }

  @action
  void setPhoneNumber(String value) {
    phoneNumber = value;
  }

  @action
  void setExperience(String value) {
    experience = value;
  }

  @action
  void setAge(String value) {
    age = value;
  }

  @action
  void setPhoneNumberErrorMessage(String value) {
    phoneNumberErrorMessage = value;
  }

  @action
  void setExperienceErrorMessage(String value) {
    experienceErrorMessage = value;
  }

  @action
  void setAgeErrorMessage(String value) {
    ageErrorMessage = value;
  }
}
