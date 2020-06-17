import 'dart:convert';

import 'package:flutter/services.dart';

class SecretLoader {
  static Future<String> getApiKey(String apiTag) {
    return rootBundle.loadStructuredData('secrets.json', (keyJson) async {
      return jsonDecode(keyJson)[apiTag];
    });
  }
}
