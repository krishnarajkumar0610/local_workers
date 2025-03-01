abstract class ISecureStorageService<T> {
  Future<bool> saveData(String key, T value);
  Future<String?> retrieveData(String key);
  Future<bool> deleteData(String key);
  Future<bool> deleteAllData();
  Future<bool> keyExists(String key); // Add this if needed
}
