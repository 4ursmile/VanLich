import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadFromStorage() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadFromStorage() => _storage.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveToStorage(bool isDarkMode) => _storage.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadFromStorage() ? ThemeMode.light : ThemeMode.dark);
    _saveToStorage(
      !_loadFromStorage(),
    );
  }

  void switchToSystem() {
    Get.changeThemeMode(ThemeMode.system);
    if (ThemeMode.system == ThemeMode.dark) {
      _saveToStorage(true);
    } else {
      _saveToStorage(false);
    }
  }
}
