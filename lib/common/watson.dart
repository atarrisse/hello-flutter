import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hello_flutter/common/secretLoader.dart';

class Watson {
  /// define singleton
  static final Watson _secrets = new Watson._internal();
  Watson._internal();
  factory Watson() => _secrets;

  final String platform = 'watsonAssistant';
  Secrets secrets = Secrets();

  var sessionID;
  String watsonAuth;
  String watsonQuery;

  Future initWatson() async {
    secrets.loadSecrets().then((res) {
      String username = 'apikey';
      String password = secrets.getSecret(platform, 'apiKey');
      var params = {'version': secrets.getSecret(platform, 'version')};

      watsonAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      watsonQuery = params.entries.map((p) => '${p.key}=${p.value}').join('&');

      _createWatsonSession().then((session) {
        sessionID = session;
      });
    });
  }

  Future<String> _createWatsonSession() async {
    var res = await http.post(
        '${secrets.getSecret(platform, 'url')}/v2/assistants/' +
            '${secrets.getSecret(platform, 'assistantID')}/sessions' +
            '?$watsonQuery',
        headers: {'Authorization': watsonAuth});

    if (res.statusCode < 200 || res.statusCode > 299)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    if (res.statusCode == 201) print("✅ session created");
    return json.decode(res.body)['session_id'];
  }

  Future deleteWatsonSession() async {
    var res = await http.delete(
        '${secrets.getSecret(platform, 'url')}/v2/assistants/' +
            '${secrets.getSecret(platform, 'assistantID')}/sessions' +
            '?$watsonQuery',
        headers: {'Authorization': watsonAuth});
    print(res);
    print(res.statusCode);
    print(res.body);
  }
}
