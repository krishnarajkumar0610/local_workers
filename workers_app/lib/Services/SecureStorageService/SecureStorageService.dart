import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_app/Services/SecureStorageService/ISecureStorageService.dart';

class SecureStorageService<T> implements ISecureStorageService<T> {
  // Save data securely
  @override
  Future<bool> saveData(String key, T value) async {
    try {
      if (key.isEmpty || value.toString().isEmpty) {
        print("Error: Key or value cannot be empty");
        return false;
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString(key, value.toString());
      return true;
    } catch (e) {
      print("Error saving data: $e");
      return false;
    }
  }

  // Retrieve data securely
  @override
  Future<String?> retrieveData(String key) async {
    try {
      if (key.isEmpty) {
        print("Error: Key cannot be empty");
        return null;
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.getString(key);
    } catch (e) {
      print("Error retrieving data: $e");
      return null;
    }
  }

  // Check if a key exists
  @override
  Future<bool> keyExists(String key) async {
    try {
      if (key.isEmpty) {
        print("Error: Key cannot be empty");
        return false;
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.containsKey(key);
    } catch (e) {
      print("Error checking key existence: $e");
      return false;
    }
  }

  // Delete specific data
  @override
  Future<bool> deleteData(String key) async {
    try {
      if (key.isEmpty) {
        print("Error: Key cannot be empty");
        return false;
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove(key);
      return true;
    } catch (e) {
      print("Error deleting data: $e");
      return false;
    }
  }

  // Delete all stored data
  @override
  Future<bool> deleteAllData() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      return true;
    } catch (e) {
      print("Error deleting all data: $e");
      return false;
    }
  }
}
