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

  String _assistantId;
  String _auth;
  String _query;
  String _url;
  String _sessionID;

  Future initWatson() async {
    secrets.loadSecrets().then((res) {
      String username = 'apikey';
      String password = secrets.getSecret(platform, 'apiKey');
      var params = {'version': secrets.getSecret(platform, 'version')};
      _assistantId = secrets.getSecret(platform, 'assistantID');
      _auth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      _query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
      _url = secrets.getSecret(platform, 'url');

      _createWatsonSession().then((session) {
        _sessionID = session;
      });
    });
  }

  Future<String> _createWatsonSession() async {
    var res = await http.post(
        '$_url/v2/assistants/$_assistantId/sessions?$_query',
        headers: {'Authorization': _auth});

    if (res.statusCode < 200 || res.statusCode > 299)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    if (res.statusCode == 201) print("✅ session created");
    return json.decode(res.body)['session_id'];
  }

  Future sendMessage(String input) async {
    var data = '{"input": {"text": "$input"}}';
    var res = await http.post(
        '$_url/v2/assistants/$_assistantId/sessions/$_sessionID/message?$_query',
        headers: {'Content-Type': 'application/json', 'Authorization': _auth},
        body: data);

    if (res.statusCode != 200)
      throw Exception('http.post error: statusCode= ${res.statusCode}');

    print(res.body);
  }

  Future deleteWatsonSession() async {
    var res = await http.delete(
        '$_url/v2/assistants/$_assistantId/sessions?$_query',
        headers: {'Authorization': _auth});
    print(res);
    print(res.statusCode);
    print(res.body);
  }
}
