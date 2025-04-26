import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  Future<void> saveList(
      String key, List<Map<String, dynamic>> newPageData) async {
    final prefs = await SharedPreferences.getInstance();

    final existingData = await getList(key);

    // Collect existing IDs
    final existingIds =
        existingData.map((item) => item['id'].toString()).toSet();

    // Only keep items that are not already saved
    final newUniqueItems = newPageData.where((item) {
      final id = item['id'].toString();
      return !existingIds.contains(id);
    }).toList();

    final updatedData = [...existingData, ...newUniqueItems];
    final encodedValue = jsonEncode(updatedData);
    await prefs.setString(key, encodedValue);
  }

  Future<List<Map<String, dynamic>>> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) {
      return [];
    }
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => json as Map<String, dynamic>).toList();
  }

  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
