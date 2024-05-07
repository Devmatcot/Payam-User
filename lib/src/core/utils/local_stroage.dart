import 'dart:convert';

import '../../../packages.dart';

final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});

class LocalStorage {
  final prefs = FlutterSecureStorage();
  get(String key) async {
    final String? data = await prefs.read(key: '$key');
    return data;
  }

  set(String key, String value) async {
    await prefs.write(key: key, value: value);
    return true;
  }

  remove(String key) async {
    await prefs.delete(key: key);
  }

  setMap(String key, Map value) async {
    await prefs.write(key: key, value: jsonEncode(value));
  }

  deleteAll() async {
    await prefs.deleteAll();
  }

  
}
