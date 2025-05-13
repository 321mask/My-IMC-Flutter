// services/imc_storage.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class IMCStorage {
  static const _key = 'imc_history';

  static Future<void> saveIMC(double imc) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];
    history.add(jsonEncode({
      'imc': imc,
      'date': DateTime.now().toIso8601String(),
    }));
    await prefs.setStringList(_key, history);
  }

  static Future<List<Map<String, dynamic>>> getIMCHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];
    return history.map((e) => jsonDecode(e)).cast<Map<String, dynamic>>().toList();
  }
}
