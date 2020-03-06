import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Secrets {
  /// define singleton
  static final Secrets _secrets = new Secrets._internal();
  Secrets._internal();
  factory Secrets() => _secrets;

  String _filePath = 'assets/secrets.json';
  var secrets;

  Future<void> loadSecrets() async {
    String result = await rootBundle.loadString(_filePath);
    secrets = json.decode(result);
  }

  getSecret(String platform, String key) {
    return secrets[platform][key];
  }
}
