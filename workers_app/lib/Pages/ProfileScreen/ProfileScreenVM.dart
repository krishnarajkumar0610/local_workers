import 'dart:convert';
import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workers_app/BOs/UserBO/UserBO.dart';
import 'package:workers_app/Helpers/AppConstants/AppConstants.dart';
import 'package:workers_app/Pages/ProfileScreen/ProfileScreenModel.dart';
import 'package:workers_app/Pages/material.dart';

class ProfileScreenVM extends ProfileScreenModel {
  ProfileScreenVM(String email, String password, String fullName, String role) {
    try {
      setImagepath("");
      setFullName(fullName);
      setEmail(email);
      setPassword(password);
      setPhoneNumber("");
      setExperience("");
      setDescription("");
      setJobTitle("");
      setJobTitleErrorMessage("");
      setAge("");
      setSelectedRole(role);
      setPhoneNumberErrorMessage("");
      setExperienceErrorMessage("");
      setAgeErrorMessage("");
      setDescriptionErrorMessage("");
      setLoading(false);
      setIsValidUser(false);
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> captureImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setImagepath(pickedImage.path);
      }
    } catch (ex) {
      print(ex);
    }
  }

  void updateLoading(bool value) {
    try {
      setLoading(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updatePhoneNumber(String value) {
    try {
      setPhoneNumber(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateExperience(String value) {
    try {
      setExperience(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateDescription(String value) {
    try {
      setDescription(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateAge(String value) {
    try {
      setAge(value);
    } catch (ex) {
      print(ex);
    }
  }

  void updateJobTitle(String value) {
    try {
      setJobTitle(value);
    } catch (ex) {
      print(ex);
    }
  }

  void validatePhoneNumber() {
    try {
      if (phoneNumber.isEmpty) {
        setPhoneNumberErrorMessage("Please enter phone number");
      } else if (!AppConstants.phoneNumberRegEx.hasMatch(phoneNumber)) {
        setPhoneNumberErrorMessage("Please enter valid phone number");
      } else {
        setPhoneNumberErrorMessage("");
      }
    } catch (ex) {
      print(ex);
    }
  }

  void validateExperience() {
    try {
      if (experience.isEmpty) {
        setExperienceErrorMessage("Please enter experience");
      } else if (int.parse(experience) <= 0) {
        setExperienceErrorMessage("Please enter valid experience");
      } else {
        setExperienceErrorMessage("");
      }
    } catch (ex) {
      print(ex);
    }
  }

  void validateAge() {
    try {
      if (age.isEmpty) {
        setAgeErrorMessage("Please enter age");
      } else if (int.parse(age) <= 0 || int.parse(age) > 80) {
        setAgeErrorMessage("Please enter valid age");
      } else if (int.parse(age) > 1 && int.parse(age) < 18) {
        setAgeErrorMessage("Only above 18 age are elligible");
      } else {
        setAgeErrorMessage("");
      }
    } catch (ex) {
      print(ex);
    }
  }

  void validateDescription() {
    try {
      if (description.isEmpty) {
        setDescriptionErrorMessage("Please enter description");
      } else {
        setDescriptionErrorMessage("");
      }
    } catch (ex) {
      print(ex);
    }
  }

  void validateJobTitle() {
    try {
      if (jobTitle.isEmpty) {
        setJobTitleErrorMessage("Please enter job title");
      } else {
        setJobTitleErrorMessage("");
      }
    } catch (ex) {
      print(ex);
    }
  }

  void validateDetails() {
    try {
      validatePhoneNumber();
      print(selectedRole);
      if (selectedRole.toLowerCase() == ("worker")) {
        print("object");
        validateExperience();
      }
      validateAge();
      validateDescription();
      if (selectedRole.toLowerCase() == ("worker")) {
        validateJobTitle();
      }
    } catch (ex) {
      // Handle the exception properly (log it or show a message)
      print(ex);
    }
  }

  void removeErrorMessage(String fieldname) {
    try {
      switch (fieldname) {
        case "phone number":
          setPhoneNumberErrorMessage("");
          break;
        case "experience":
          setExperienceErrorMessage("");
          break;
        case "age":
          setAgeErrorMessage("");
          break;
        case "description":
          setDescriptionErrorMessage("");
          break;
        case "job":
          setJobTitleErrorMessage("");
          break;
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> saveDetails() async {
    try {
      await secureStorageService.deleteAllData();
      // validateDetails();
      // if (phoneNumberErrorMessage.isEmpty &&
      //     experienceErrorMessage.isEmpty &&
      //     ageErrorMessage.isEmpty) {
      //   String? idResponse =
      //       await secureStorageService.retrieveData(AppConstants.idKey);
      //   int currentId = jsonDecode(idResponse ?? "0");

      //   // Retrieve existing users from storage
      //   String? usersResponse = await secureStorageService
      //       .retrieveData(AppConstants.listOfUsersKey);

      //   List<dynamic> usersList = [];

      //   if (usersResponse != null && usersResponse.isNotEmpty) {
      //     try {
      //       usersList = jsonDecode(usersResponse);
      //     } catch (e) {
      //       print("Error decoding existing users: $e");
      //       usersList = [];
      //     }
      //   }

      //   // Check if user already exists
      //   int userIndex =
      //       usersList.indexWhere((user) => user["emailId"] == email);

      //   if (userIndex != -1) {
      //     // User exists, update details if imagePath is not empty
      //     if (imagepath.isNotEmpty) {
      //       usersList[userIndex]["profile"] = {
      //         "profileImg": imagepath,
      //         "phoneNumber": phoneNumber,
      //         "experience": experience,
      //         "description": description,
      //         "jobTitle": jobTitle,
      //         "age": age,
      //       };
      //       setIsValidUser(true);
      //     } else {
      //       print("Image path is empty, user data not updated.");
      //       setIsValidUser(false);
      //     }
      //   } else {
      //     // New user, add to list
      //     Map<String, dynamic> userData = {
      //       "id": ++currentId,
      //       "emailId": email,
      //       "fullName": fullName,
      //       "password": password,
      //       "profile": {
      //         "profileImg": imagepath,
      //         "phoneNumber": phoneNumber,
      //         "experience": experience,
      //         "description": description,
      //         "jobTitle": jobTitle,
      //         "age": age,
      //       },
      //       "clients": []
      //     };

      //     usersList.add(userData);
      //   }
      //   print(usersList);
      //   // Save updated user list
      //   bool userSignUpResponse = await secureStorageService.saveData(
      //       AppConstants.listOfUsersKey, usersList);
      //   bool idSaveResponse = await secureStorageService.saveData(
      //       AppConstants.idKey, currentId);
      //   print("SAVE RESPONSE: $userSignUpResponse");
      //   setIsValidUser(true);
      // }
    } catch (ex) {
      print("Error in saveDetails: $ex");
    }
  }
}



/// Done until the profile screen
/// 
/// need to do is store the profile screen's data filled in shared pref