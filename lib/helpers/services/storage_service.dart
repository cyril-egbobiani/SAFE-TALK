import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage_service.dart';

class StorageService {
  final SecureStorageService _secureStorageService = SecureStorageService();
  final _storage = const FlutterSecureStorage();

  Future saveInteger(String key, int value) async {
    await _secureStorageService.setIntValue(key, value);
  }

  Future<int?> getInteger(String key) async {
    return await _secureStorageService.getIntValue(key);
  }

  Future saveString(String key, String value) async {
    await _secureStorageService.setStringValue(key, value);
  }

  Future<String?> getString(String key) async {
    return await _secureStorageService.getStringValue(key);
  }

  Future saveBoolean(String key, bool value) async {
    _secureStorageService.setBooleanValue(key, value);
  }

  Future<bool> getBoolean(String key) async {
    return await _secureStorageService.getBooleanValue(key);
  }

  void deleteValue(String key) async {
    await _secureStorageService.removeValue(key);
  }

  // Store and Update likedProducts
  Future<void> updateAndStoreLikedProducts(List<int> updatedArray) async {
    // Convert the updated array to a string for storage
    final updatedArrayString =
        updatedArray.map((number) => number.toString()).join(',');
    await _storage.write(key: 'likedProducts', value: updatedArrayString);
  }

  // Retrieve liked product IDs
  Future<List<int>> getStoreLikedProducts() async {
    final storedArrayString = await _storage.read(key: 'likedProducts');

    if (storedArrayString != null) {
      // Use try-catch to handle potential FormatException
      try {
        // Convert the stored string back to a list of integers
        final storedArray =
            storedArrayString.split(',').map((str) => int.parse(str)).toList();
        return storedArray;
      } catch (e) {
        print("Error parsing stored array: $e");
        // Handle the error, perhaps return a default value or show an error message
        return <int>[];
      }
    } else {
      // Handle the case when the array is not stored yet
      return <int>[];
    }
  }

  Future<void> clearOldData() async {
    const _storage = FlutterSecureStorage();
    await _storage.deleteAll();
  }
}
